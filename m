Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB47A1D63F5;
	Tue, 16 Dec 2025 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765902299; cv=none; b=kBA3d/aVpWFE78DhjZibmMg6AZzx5k1lOJenN2o1TlhFxssr26qhNtHQj2Hc/Uyu1zQPYqNpnYjWnCLxLTVp+vZZXss3w3drN/7dOS5blcJ7Toh5odBuOcUH+oQPHyIX5UG6PWYphhCewLTgUsf1flC1Sx5eGIOZPypAiq/vTnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765902299; c=relaxed/simple;
	bh=3E2x6L/4+g16Enm6XkGQqRFCPqZVrvyy88dmf6wJIQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJXJYkn3rpRs3SESIqcmjW9jEJ/G/JUk/iv8pZvvR1JbET7GC3EBsICflsCBGu47+/AcSW+SwipvsA0rLWFLCv/YRwywp7AlPyMwBmg5+kd11fbqfML4FEDISDak0zv3WibH8ZzT4LWvZrQhnJm6uMlOyV3rMLBdCubX8eKODpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vi+xRr2i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vi+xRr2i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11487C113D0;
	Tue, 16 Dec 2025 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765902298;
	bh=3E2x6L/4+g16Enm6XkGQqRFCPqZVrvyy88dmf6wJIQ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vi+xRr2iKtvzNHIIukg3+3EPfxkx5B8Cq1Zm8B/4tyW8rUvjZofkdcv+XAiFFd9b8
	 U5GCjJi12pNn/WslRFb8ytybRPz761qQDuE154t6gRdbb78gewnPsmdXbjggbEepoS
	 tdXrrPIluSdQnQMkALy2vRYZ8eOvIJipErCGKxbYsSo3j+55zRNMltlEQSz4NYrMVC
	 hvXY27XJ2oTDE983K/kd2ozWdwMWl6tDhbCwqOebGUau/pm/8U2hyzPtyXDYBsqnIx
	 foCnZUfurmh8GBjG0rbiJj4sQ0nnlq8xWwDkXCWSqaYVyCRtSisHaoLIAL6XYkNwm0
	 8kbDxdVyTFotw==
Message-ID: <5a47b072-70e5-42d2-9774-5637abd00c13@kernel.org>
Date: Tue, 16 Dec 2025 17:24:54 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] LoongArch: dts: loongson-2k1000: Fix i2c-gpio node
 names
To: Yao Zi <me@ziyao.cc>, Binbin Zhou <zhoubinbin@loongson.cn>,
 Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
 loongarch@lists.linux.dev, devicetree@vger.kernel.org
References: <cover.1765778124.git.zhoubinbin@loongson.cn>
 <9684ae4e58fd1e9768cccf6e3ae730eff46fb29c.1765778124.git.zhoubinbin@loongson.cn>
 <aUEp-pEwHk0Ls6CD@pie>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aUEp-pEwHk0Ls6CD@pie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/12/2025 10:44, Yao Zi wrote:
> On Tue, Dec 16, 2025 at 03:56:59PM +0800, Binbin Zhou wrote:
>> From: Binbin Zhou <zhoubb.aaron@gmail.com>
>>
>> The binding wants the node to be named "i2c-number", alternatively
>> "i2c@address", but those are named "i2c-gpio-number" instead.
>>
>> Rename those to i2c-0, i2c-1 to adhere to the binding and suppress
>> dtbs_check warnings.
> 
> I think this is an unintended breakage in dtschema upstream, but not
> really a violation. As I've mentioned in my original cover-letter,
> 
>> which IMHO is a regression caused by dt-schema commit 57138f5b8c92
>> ("schemas: i2c: Avoid extra characters in i2c nodename pattern"). Commit
>> 647181a1f8ff ("schemas: i2c: Allow for 'i2c-.*' node names") fails to
>> fix the case, as it doesn't take nodenames with multiple hyphens in
>> account. I'll start a separate series for this.
> 
> So I think it should probably be fixed in dt-schema instead. i2c-gpio-X
> provides more information to me, and I don't think it causes any
> inconsistency or ambiguity.
> 
> By the way, we also have dozens of arm dtb targets shipping nodes named
> like i2c-gpio-*, mostly microchip and st ones, fixing the regex in
> dtschema upstream will also eliminate warnings for them.

No. Wolfram posted patches at some point, some parts got applied or at
least followed up by maintainers who care. Maybe Wolfram never resubmit
microchip and stm, but that's not the reason to roll back to discouraged
name.

Best regards,
Krzysztof
