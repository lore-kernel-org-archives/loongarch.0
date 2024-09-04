Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D01E79DE
	for <loongarch@lists.linux.dev>; Wed,  4 Sep 2024 01:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725412566; cv=none; b=M8Q5/fM/ddKegEGSAOED8P+F+EeO2KsgtUS5arXOSixJNVnfEsCR1lPJ2C6wOTRk/SdRiIWjfnstzeFhmLRxzq8WcUngFoxITWaAtEUz6X9ozxEl5HLkI2O1a13jSAP1pGGdwXAY3xB41FjByNWnRcn6DLjjnSrTIkDvS9TgKJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725412566; c=relaxed/simple;
	bh=9lrTEjGx49ggIDY773iVJJwYcmojKAO9Di+PWU9h79g=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=KkR4+BoLKV7bFaR1GLF5cfQNunHtoWAkXaUZb14mLofuX+c43bURpVX3cMheglBtzMTN5l5t8XGU2tXy6YRlGvvRaC7b+OWNx0XTm1dIjLBZDek0HTPuG3KIQkeyiN8meQU0jJV1o8kjcysXfU9VLXv5qHV0uCIieMM/ia88XkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8Bx35vPtNdm_88pAA--.54818S3;
	Wed, 04 Sep 2024 09:15:59 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front2 (Coremail) with SMTP id qciowMBxzsXOtNdm9m8FAA--.15006S2;
	Wed, 04 Sep 2024 09:15:58 +0800 (CST)
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
From: Zhao Qunqin <zhaoqunqin@loongson.cn>
Message-ID: <32aded46-86ce-59cf-e8b4-2621c0dd9ebe@loongson.cn>
Date: Wed, 4 Sep 2024 09:15:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c901ff6b-2e4d-4dd1-82da-e2e3d5db7988@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qciowMBxzsXOtNdm9m8FAA--.15006S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUPKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCF54CYxVAaw2AFwI0_Jrv_JF1l4c8EcI0Ec7Cj
	xVAaw2AFwI0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j1WlkUUUUU=


在 2024/9/3 下午8:29, Krzysztof Kozlowski 写道:
> On 03/09/2024 13:47, Zhao Qunqin wrote:
>> add device tree bindings for ls3a5000 EDAC driver.
>>
>> Signed-off-by: Zhao Qunqin <zhaoqunqin@loongson.cn>
> So no improvements? No changes? Why do you send the same?

I'm sorry,  I thought if you hadn't raised any issues with the previous 
version of dt binding, I wouldn't need to make any changes.

For this version of the patch, I only changed the driver.

Best regards,

Zhao Qunqin.

>
> Best regards,
> Krzysztof

