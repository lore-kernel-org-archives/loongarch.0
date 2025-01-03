Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DFB1946B9;
	Fri,  3 Jan 2025 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735893411; cv=none; b=fXPppVJvsXtisl6HrQiPdNFLLmA+Z1iMFh12DE8XpOHMBNr/MAAaAqIohtjxNMAuTKKwDMwn+e712tsR8XLPd3XxMICaJvI3yX/nh2uabGIBBFJyvC51AJ4NCYU7Fo6s+zojMz0oJ1MGGJKagZju9P61E1fME5vc9lVML+G21pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735893411; c=relaxed/simple;
	bh=QwIsgMxn/U7WHEbneDjA8/ACMna/57h2AO14RVvcWC0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ku7m2buEBe8lA3iF7h8sYAC4mpvE2PrBH5kjM+CeWD1RL8ckgWaqQwaTL0tBQM/+LbkjeiitnA4YDCQjhzVEnF8+c3KAseaCFP+v3KUnAzSA02PKwKKMJa4ztTmRYM97XeyaTEkPDwrdZAQSmLlYRSDoRNu7JOERUPaSlZsZ0zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8DxQK+eoXdnCo9dAA--.28749S3;
	Fri, 03 Jan 2025 16:36:46 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front1 (Coremail) with SMTP id qMiowMDxK8WboXdnkUkSAA--.1086S2;
	Fri, 03 Jan 2025 16:36:45 +0800 (CST)
Subject: Re: [PATCH V2 RESEND] soc: loongson: add Loongson Security Module
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arnd@arndb.de, olof@lixom.net, soc@kernel.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, xry111@xry111.site,
 christophe.jaillet@wanadoo.fr
References: <20241224072500.15669-1-zhaoqunqin@loongson.cn>
 <f9138082-1d17-4247-b365-7cb4eef88879@kernel.org>
 <22cb222a-a34d-b2ff-88cf-2e9433aed310@loongson.cn>
 <c80efae8-7f5c-4f2e-92c0-510511004ad1@kernel.org>
From: Zhao Qunqin <zhaoqunqin@loongson.cn>
Message-ID: <ad63f9ab-90cb-abe7-8099-2666e9a65a56@loongson.cn>
Date: Fri, 3 Jan 2025 16:35:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c80efae8-7f5c-4f2e-92c0-510511004ad1@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMDxK8WboXdnkUkSAA--.1086S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7GF1kArW3KFyfCFy5KF15Awc_yoW8JrWUpr
	4xJ3Z2kF4DCr1Skw4DKw4jyF4Yy3s3KFZrXrZ8W34UZF98ta45JF1xXa1jvr9xZr18Jr4I
	yw43GrZxGa98ZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jU
	sqXUUUUU=


在 2025/1/3 下午3:26, Krzysztof Kozlowski 写道:
> On 03/01/2025 03:25, Zhao Qunqin wrote:
>> 在 2024/12/28 下午7:02, Krzysztof Kozlowski 写道:
>>>> Only ACPI firmware is supported.
>>>>
>>>> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
>>> I don't get why you are sending this to soc. This is loongson specific
>>> and is supposed to go via Loongson maintainers.
>>>
>>> And why is this a resend?
>> There are no platform-specific maintainers, So I initially sent the
>> patch to Arnd,
> What do you mean by "no platform-specific maintainers"? This
> architecture and this platform is abandoned?

Sorry for my poor english. This architecture and this  platform is not 
ababdoned.

What I mean is that there are no Loongson staff to maintain 
drivers/soc/loongson.

The current maintainer  for drivers/soc/loongson is Arnd.


Thanks for your response.

> Then we should either drop it from the kernel or make it orphaned.
>
>
>> but didn't receive a response from Arnold, so I resent the patch and added
>>
>> soc@kernel.org to the mailing list.
> You shouldn't. This is patch for your maintainers to take. If you do not
> have them: either fix that or abandon/orphan the platform.
>
>
> Best regards,
> Krzysztof

