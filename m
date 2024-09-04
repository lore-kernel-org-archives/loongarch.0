Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D3E1CCB3E
	for <loongarch@lists.linux.dev>; Wed,  4 Sep 2024 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725439951; cv=none; b=Fg3Ls7zihVcSwEWX5razI2h1FMOmUVDY63xEn4glV/bKOncmM9i5RWlBNFoWUxFpUxtKDF/3mEc3UAgpmC+J+lQOXktkOJfquvpI8KqXwsF3tO75gMTkqeJiFwdYZWt9Xnrk0jnevJA9jkZD2qhC492DaAesCXjtuU1aU3JRX+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725439951; c=relaxed/simple;
	bh=IvkSCBt+3+2VjlsISB6I1MkJWO67OCf7/ELVtxu1nT8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=HJjQwWEYmXq5UZWknsspwujciTbmGc/sGFvC6v6EBr96Cv4gBXO9eYJxr5Lj7RA/Mh5sESCvQC2OwtdnpqrItZt10aS+Wo4Fyrb0p0+9pBrrr/Y8DnfJeGJDEkhxMBfcqUUvKA6kmjdxY2DOowThMf4eHZJn5KwmdHd6e5ppJY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8Bx7erFH9hmkBYqAA--.15912S3;
	Wed, 04 Sep 2024 16:52:21 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front2 (Coremail) with SMTP id qciowMCxH8bDH9hmi64FAA--.16454S2;
	Wed, 04 Sep 2024 16:52:20 +0800 (CST)
Subject: Re: [PATCH V3 1/2] dt-bindings: EDAC for ls3a5000 memory controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 chenhuacai@kernel.org, linux-edac@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@xen0n.name,
 bp@alien8.de, tony.luck@intel.com, james.morse@arm.com, mchehab@kernel.org,
 rric@kernel.org, loongarch@lists.linux.dev
References: <20240903114714.11428-1-zhaoqunqin@loongson.cn>
 <20240903114714.11428-2-zhaoqunqin@loongson.cn>
 <c901ff6b-2e4d-4dd1-82da-e2e3d5db7988@kernel.org>
 <32aded46-86ce-59cf-e8b4-2621c0dd9ebe@loongson.cn>
 <c1508929-2e44-497d-b54a-285a3e74ba2d@kernel.org>
From: Zhao Qunqin <zhaoqunqin@loongson.cn>
Message-ID: <3beb1cf3-c033-bdec-7d38-f43889d4dc2c@loongson.cn>
Date: Wed, 4 Sep 2024 16:51:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c1508929-2e44-497d-b54a-285a3e74ba2d@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qciowMCxH8bDH9hmi64FAA--.16454S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jw4Uuw4DCF45XFW5ZFW7WrX_yoWDJwb_Kw
	4YywnruwnFya4kGFsxJF4xJryvqw4UtrWUur1kXr1Fqw1FqFZrZr4rK34fZw15JFW3WFnr
	CFZrWFWkCr9xuosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbaAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU8lAp5UUUUU==


在 2024/9/4 下午1:51, Krzysztof Kozlowski 写道:
> On 04/09/2024 03:15, Zhao Qunqin wrote:
>> 在 2024/9/3 下午8:29, Krzysztof Kozlowski 写道:
>>> On 03/09/2024 13:47, Zhao Qunqin wrote:
>>>> add device tree bindings for ls3a5000 EDAC driver.
>>>>
>>>> Signed-off-by: Zhao Qunqin <zhaoqunqin@loongson.cn>
>>> So no improvements? No changes? Why do you send the same?
>> I'm sorry,  I thought if you hadn't raised any issues with the previous
>> version of dt binding, I wouldn't need to make any changes.
>>
>> For this version of the patch, I only changed the driver.
> So what changed? Where is the changelog? Where is the tag? Did you get one?
>
> Did you read submitting patches document?

My apologies! I must have missed a part of the content in the document, 
please forgive me for wasting your time.

Will add tag and changelog in  patch v4.

Thank you very much for taking the time to review.


Best regards,

Zhao Qunqin.

>
> Best regards,
> Krzysztof

