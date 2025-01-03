Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A371CEAC2;
	Fri,  3 Jan 2025 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735894037; cv=none; b=qjgXvKZmZJcDIFFneW4+PpUEheCfd5ci8e3oJgk/mSF7Oin1f8ZxDRCdG3JArU9mmdyfE90xnGaYRJV2nLqeCHF4n80oppEs0w5K+bnzo/wMeP0oXdvjEIlRRIQNUL24/KmdNOnp22rXoKZ+c5d8wDcQs4P5N186nO7lWeu2qQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735894037; c=relaxed/simple;
	bh=T9AJXRxpUMd1UoPj9kGqfLl3FPDFqsvZWJ8jYYHnx+U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=optRnN1XvkFL+QaGl3tjfH2uYvPJSUaWjgEqWzMy6JkX+GsLX5DVXos3xTGFwQX3w4Q1ghS2lO4ywgweIlLNTrf9gHQCF4Wlh4gQM/gzcctTv9Q19QagDhSmuOls5S0tWQ1asOd6R29xbiueu/3whKJDGz0Bpbmqy+lJbuW7Zjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQJQhfSX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQJQhfSX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF331C4CECE;
	Fri,  3 Jan 2025 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735894036;
	bh=T9AJXRxpUMd1UoPj9kGqfLl3FPDFqsvZWJ8jYYHnx+U=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=lQJQhfSXDhnQLvRH4K+vYuz8jbgCicLZNuPGCT/mm/CFwRfXk82QMubu78zm9tiMX
	 npTyYruxVlo/dlSGsUJsbmVbWJ8Lhttak2QsI4G+yGz1UAv7K1OCHZ8o4MM/b0rzNP
	 rgkpO9T9A6djTepyB2DR+udnV4Ti3yXpZGD+kp1Ks+dYEKY01FUIhXETa5xOMMU1IG
	 TbQRBLV3voF5saDcO9QpfOts2/l6WciSE+6Lp5EFMwvayR4DAZ5ptwOa321eIGjU5u
	 VgvykcbKjie5KiZVjsjIrRaI0rDkV2c2kTTbQOya5EfsbQk+m/tlEfCZ2G25Klq8A3
	 94oUqg8M4c9Mg==
Message-ID: <1c6de9fe-949e-4e0a-bcb6-7640bad575dc@kernel.org>
Date: Fri, 3 Jan 2025 09:47:10 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 RESEND] soc: loongson: add Loongson Security Module
 driver
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhao Qunqin <zhaoqunqin@loongson.cn>
Cc: arnd@arndb.de, olof@lixom.net, soc@kernel.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, xry111@xry111.site,
 christophe.jaillet@wanadoo.fr
References: <20241224072500.15669-1-zhaoqunqin@loongson.cn>
 <f9138082-1d17-4247-b365-7cb4eef88879@kernel.org>
 <22cb222a-a34d-b2ff-88cf-2e9433aed310@loongson.cn>
 <c80efae8-7f5c-4f2e-92c0-510511004ad1@kernel.org>
 <ad63f9ab-90cb-abe7-8099-2666e9a65a56@loongson.cn>
 <ad947db9-119b-4931-ab13-31ea25a66db9@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ad947db9-119b-4931-ab13-31ea25a66db9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/01/2025 09:46, Krzysztof Kozlowski wrote:
> On 03/01/2025 09:35, Zhao Qunqin wrote:
>>
>> 在 2025/1/3 下午3:26, Krzysztof Kozlowski 写道:
>>> On 03/01/2025 03:25, Zhao Qunqin wrote:
>>>> 在 2024/12/28 下午7:02, Krzysztof Kozlowski 写道:
>>>>>> Only ACPI firmware is supported.
>>>>>>
>>>>>> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
>>>>> I don't get why you are sending this to soc. This is loongson specific
>>>>> and is supposed to go via Loongson maintainers.
>>>>>
>>>>> And why is this a resend?
>>>> There are no platform-specific maintainers, So I initially sent the
>>>> patch to Arnd,
>>> What do you mean by "no platform-specific maintainers"? This
>>> architecture and this platform is abandoned?
>>
>> Sorry for my poor english. This architecture and this  platform is not 
>> ababdoned.
>>
>> What I mean is that there are no Loongson staff to maintain 
>> drivers/soc/loongson.
> 
> But there are maintainers of the platform, are they? Someone cares about
> Loongson or not?
> 
> If someone cares, then Cc this person and this person is responsible for
> handling your patches. This is called "maintainer".
> 
> If no one cares, then platform is abandoned and we should consider
> calling it orphaned in Linux.
> 
>>
>> The current maintainer  for drivers/soc/loongson is Arnd.
> 
> I don't think so. First, it is unusual. Second, maintainers disagree

^^^ By "maintainers" I meant here the "MAINTAINERS" file, so
scripts/get_maintainers.pl.

> with you on above statement.
> 
> You keep disagreeing here with me and I am afraid we will end up in
> endless discussion, so to reiterate because maybe I wrote my emails too
> soft or too conditional, instead of stating the desired outcome:
> Please send your Loongson SoC drivers to Loongson maintainers and they
> are supposed to take it. If they do not take it, I will send patch for
> making the platform orphaned.


Best regards,
Krzysztof
