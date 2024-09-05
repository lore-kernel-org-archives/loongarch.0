Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F21A194A73
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 08:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725524043; cv=none; b=Tj7njdIpt8Wjpld5xlRJglLK+m5MkXkwoAUwSLIe9t7ar7nZ41K309hERTjADTayQHHCk/Uklk8yycqcywl40qD6pCJkR0AdbCkNiqhj31Wn9msKl96QIDeTCVsOLF4Ud91QPVyu6yEUzpR5FzpNUyucGULHXW8Wg/cnKPXJBto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725524043; c=relaxed/simple;
	bh=QLKxbHMP+ejjsFvxECETv5D7iVbffeiUUZKqK6+CvGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mS7wJu/oWWsMjLspAtH3+MuiDyI+cJFtiOv/nz6hZWPTSo9UksxPnNjPavewQnuGoE/I/2Fez1idca6/pCQI+XM7f6MfN5cKpG2rTZooUuVjWGr+ZOT8nLvDq8zWz58xaKH1naJ8SBgVdOPkSdbfI1XzA8cey+AQIMvpYZNKMck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xzhB/oJn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xzhB/oJn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42c88128315so591815e9.0
        for <loongarch@lists.linux.dev>; Thu, 05 Sep 2024 01:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725524040; x=1726128840; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KiCzZro1prNiZuCvQ/hNppHkycjB/VLB261iHPlTgAA=;
        b=xzhB/oJnJPiq3tRULaLhQ8Y3H3AOZnoOlFJeRP1bNYqWTqtIYeKLPw9bNv0fmOz5la
         L6hwzy2KeNhXXD7tWGSnhJDMoVd0Bbh4/zaA7TLcxfTz/F6aCmMylSpoTE0LENMxMrbh
         1xszFkfxDHEzhbcV4FTQ+2L+DKKofZkaZv/pPXSZ3ZngyBqX0FjKnrelyk04bJo2knVh
         DDQQSk19taungTKVVHW/AOnaz2unWgNfRyx9s9gEs/Pgw5VKDkrX5jzz8KAugmrFTuri
         c0Q/uPaz57Iz1ogTDpw7koYzJ8lR62rWWn3IqO0CP1J6hp9gDCPuotHAXt2Tc8qm7kUN
         fYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725524040; x=1726128840;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiCzZro1prNiZuCvQ/hNppHkycjB/VLB261iHPlTgAA=;
        b=BVEY16uhi8WjReDjy9GURSuIir7u+LsPZcfIDe0Bgw6qjWzhPX87bJ9hBRQ0kjio3a
         7i66YL8BuK8FhfLI3BkpyEI3vcSVAxLNZb5EBmyitXhJvIYrh5XN4iXzeYCc8PIepTXJ
         g8XeTXgpuWxN3K6px60rj/dU1mSidXWM8Y1ueB8GKwXtupxG21zuN/HfIpCW+sfqR/1E
         djYwAMte2zttjuuKAzG+mPIzxwXxBpqdodONaKG75abKTC/Xh4PRsIRtiwK7FCzzjnaf
         PD8ploh9vWsQun5JBumnEVjWdgVr6VwC2LhsxkPIBCAAYNIU+d83/jbB3C41J4GLd07L
         W8Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXkN/JuH2QMMTEjm/dzGNG8mTgEemMAYQVWiGrv/Vk+f9ff0q47Wdu7u+IhKvbIWSNhRouyva8s0O8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEJWRkh1HYE7GI5jEMh91VVNs7NHRART72H/D6vGm1FJCVGKwe
	/hFulznWhaqf8y5HKDZ4QNygD1OblYCHQ+0iYkE7LX0hTpL5/fJEEFGVl9KtO4Y=
X-Google-Smtp-Source: AGHT+IFsnqYs/BKxKkBbwUhCyfxh093ihj4ZVz75ubjbmzBpzofDhEAd/UKBqJDU8mVHdDLgje5CQw==
X-Received: by 2002:a05:6000:4012:b0:376:3ef8:61ab with SMTP id ffacd0b85a97d-3763ef862a0mr2835112f8f.8.1725524039663;
        Thu, 05 Sep 2024 01:13:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c046685fsm13637497f8f.79.2024.09.05.01.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 01:13:59 -0700 (PDT)
Message-ID: <f581c749-999f-44a3-94a8-a39d355c32c5@linaro.org>
Date: Thu, 5 Sep 2024 10:13:57 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/10] ASoC: Some issues about loongson i2s
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
 loongarch@lists.linux.dev
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <cover.1725518229.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2024 09:02, Binbin Zhou wrote:
> Hi all:
> 
> This patch set is mainly about Loongson i2s related issues.
> 
> Please allow me to briefly explain this patch set:
> Patch 1-2: Add ES8323 codec required on Loongson-2K2000
> Patch 3-4: Add uda1342 codec required on Loongson-2K1000
> Patch 5: Improve code readability
> Patch 6: Fix the problem of unable to detect codec under FDT system.
> Patch 7-8: Add Loongson i2s platform device support
> Patch 9-10: Related DTS support.

This was based on some old tree... or you do not use get_maintainers.pl.

Best regards,
Krzysztof

