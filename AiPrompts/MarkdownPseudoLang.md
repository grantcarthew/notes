# Markdown Pseudo-Language Specification

After reading a few articles online, I asked ChatGPT v4 to create a prompt specification with the following prompt:

```text
Your task is to invent a pseudo language based on markdown for prompting GPT-4. Do not use custom syntax, stick to the common markdown specification. It should be obvious enough that the GPT does not need the language specification to interpret the language. Please share the specification and supply justification for the features you include.
```

This document is the result of that prompt starting with this introduction:

Introducing Markdown-GPT (MD-GPT), a pseudo language based on the common markdown specification designed for prompting GPT-4. This pseudo language will allow users to easily structure prompts, highlight the intent of their queries, and better understand the desired output format.

## 1. Headers

Use headers to specify the hierarchy of the prompt and provide context. The depth of the header (#, ##, ###, etc.) can denote the importance or priority of the information.

Example:

```text
# Main Topic
## Subtopic
### Further details
```

Justification: Headers provide a clear structure and organization to the prompt, making it easier for GPT-4 to understand the context and hierarchy of the query.

## 2. Lists

Use ordered (numbered) and unordered (bulleted) lists to present a sequence of related points or items.

Example:

```text
- Point 1
- Point 2
- Point 3
```

or

```text
1. Step 1
2. Step 2
3. Step 3
```

Justification: Lists help break down complex ideas into smaller, more manageable pieces, enabling GPT-4 to process and address each point effectively.

## 3. Emphasis

Use bold (**text**) and italics (*text*) to emphasize key terms, phrases, or important information within the prompt.

Example:

```text
Please describe the **differences** between *Newtonian physics* and *quantum physics*.
```

Justification: Emphasis on important terms can help guide GPT-4's focus towards specific concepts or tasks, ensuring relevant and accurate responses.

## 4. Blockquotes

Use blockquotes (> or >>) to quote previous responses, reference external information, or provide examples.

Example:

```text
> Albert Einstein once said, "Imagination is more important than knowledge."
What did Einstein mean by this statement?
```

Justification: Blockquotes provide context, help reference important information, and allow GPT-4 to understand the relation between the quote and the query.

## 5. Inline code and code blocks

Use inline code (`code`) to specify technical terms, code snippets, or variables. Use code blocks (triple backticks) for multiline code or data representations.

Example:

````text
Please explain the use of the Python function `len()` in the following code snippet:

```python
string = "Hello, world!"
length = len(string)
print(length)
```
````

Justification: Inline code and code blocks help GPT-4 identify and interpret technical terms, code, or data accurately, ensuring a relevant response in a technical context.

## 6. Examples

Below are some examples of using the *md-gpt* specification for prompts. You can also see the [prompts directory](prompts) looking for `.md` files for other examples.

## Expert Questions and Answer Session

A question and answer session with ChatGPT as the expert on the subject of climate change, using the MD-GPT specification to structure the prompt.

```markdown
# Climate Change Discussion

## Question 1: Greenhouse Gases

Please provide a brief **overview** of the *main greenhouse gases* and their *sources* in the context of climate change.

## Question 2: Climate Models

> A user asked: "How reliable are climate models in predicting future climate changes?"

What would you say are the **strengths** and **limitations** of *climate models* in predicting future climate changes, and how can they be improved?

## Question 3: Carbon Capture

### Background

Carbon capture and storage (CCS) is a technology that can potentially reduce CO2 emissions from power plants and other industrial sources.

### Query

*Explain* how **carbon capture and storage** works, and discuss its *feasibility* and *challenges* in mitigating climate change.

## Question 4: Personal Actions

In the context of **individual actions** to combat climate change, list the *top 5 effective measures* a person can take to reduce their carbon footprint.
```

## Python Script Writing

Request a Python script to analyze data.

````markdown
# Python Script Request

Please write a **Python script** to analyze a given dataset and output the _mean_, _median_, _mode_, _standard deviation_, and _variance_ of the data.

## Restrictions and Preferences

**Constraints:**

*   Use **Python 3.7** or higher.
*   Adhere to **PEP 8** style guidelines.

**Response Customization:**

*   _Do not apologize_ in your response.
*   Assume you are _talking to an expert_; keep explanations simple.

**Dataset Input Format:**


```python
data = [value1, value2, value3, ...]
```

**Expected Output Format:**

```python
{
    "mean": mean_value,
    "median": median_value,
    "mode": mode_value,
    "std_dev": std_dev_value,
    "variance": variance_value
}
```
````
