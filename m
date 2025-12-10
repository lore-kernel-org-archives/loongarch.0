Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEA025F988
	for <loongarch@lists.linux.dev>; Wed, 10 Dec 2025 02:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765333712; cv=none; b=G9bMA+eIrxUdCpFve7OHfOhavScEh5erb5liTDhOCoyqmE5BkG+DbMA24Dkic1Y0NOsHt42JCUOnswsoJ+e460QdpKvfLtp/3rOGgk6eMU4dCsiLhR7t24k749AFwj31BQP+K8p+RL7C5SeuqUOBlLdIcyjx0kTO9DHUmEBsAfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765333712; c=relaxed/simple;
	bh=VMTnL9x31mHm1fLpRAr/l9LqamICfjGH3A9K0Leuc+4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FcR6kOIXsO4YgMfhtLCblPnThkaEs1xmH51PJAZMe682dsOIbmEQvG3SGxKsJZr91nNgSiMj6QJTRUbuVLjUgzysoNrUDWowsfY3I/Mu34ddXCb4YlX6udGPp2IXzSdmtxLBQUumylwmgay5daGOymPt/AhC7DcFVC5yOdY93KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxqdHK2jhpHOAsAA--.31884S3;
	Wed, 10 Dec 2025 10:28:26 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxysDH2jhp6qZHAQ--.36271S3;
	Wed, 10 Dec 2025 10:28:26 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Remove unnecessary checks in bt_address()
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251209061809.15994-1-yangtiezhu@loongson.cn>
 <CAAhV-H6zjWXjjuoOkRov4886E82QRH=3NnkhP2e4hroSJr1UXg@mail.gmail.com>
 <92bf0e88-da14-20ce-137a-3e7777e19af3@loongson.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <ba1494da-a407-3acb-a5d1-8fbd9498b6c6@loongson.cn>
Date: Wed, 10 Dec 2025 10:25:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <92bf0e88-da14-20ce-137a-3e7777e19af3@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxysDH2jhp6qZHAQ--.36271S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WryxKr1kuw13CFWxGF13Jrc_yoW8GFWkpF
	97GFyUWFyDKr48JrsrWr1Fqr90yrnxJ3Wjgr4UJFn5Cwn0qr1SvF1j9a42g3W8tr48Xw48
	Zw18ArsF9a98AFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9ab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU8I38UUUUUU==



On 2025/12/10 上午9:28, Tiezhu Yang wrote:
> On 2025/12/9 下午4:30, Huacai Chen wrote:
>> Hi, Tiezhu,
>>
>> On Tue, Dec 9, 2025 at 2:18 PM Tiezhu Yang <yangtiezhu@loongson.cn> 
>> wrote:
>>>
> ...
>>>          extern unsigned long eentry;
>>>
>>> -       if (__kernel_text_address(ra))
>>> -               return ra;
>>> -
>>> -       if (__module_text_address(ra))
>>> -               return ra;
>> I think the correct way is to remove the __module_text_address()
>> condition but keep the __kernel_text_address() condition. Then return
>> 0 at the end of this function, and remove the __kernel_text_address()
>> condition out of this function.
> 
> It can not remove the check of __kernel_text_address() after calling
> bt_address() because it needs to validate the calculated address for
> exception, then no need to keep the __kernel_text_address() condition
> in bt_address() because it will check the PC outside bt_address().
         state->pc = bt_address(pc);
         if (!state->pc) {
                 pr_err("cannot find unwind pc at %p\n", (void *)pc);
                 goto err;
         }

         if (!__kernel_text_address(state->pc))
                 goto err;
I guess that you both comes from different views :) one treats these 
piece of code into one, one only views function bt_address().

Especially with if (!state->pc), how could this happen?

Regards
Bibo Mao

> 
> Thanks,
> Tiezhu
> 

