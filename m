Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59AF213254
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 01:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764207563; cv=none; b=aFzs+VErzUMFiO5qjxRCfG86VYu68deKMb/J8fNKlx8+5vxPRdka7dlRsjFbLXX5Bhf8EmYOSk35Rmi8XDCL8O09hKgMyjJ+L71UQSNiSrJfTCJemm5Qx/DP3uXYXl/jQr8NxhQjdE1GNVMMoOLdcpsDKAw7kjyxuLfqPOUOcQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764207563; c=relaxed/simple;
	bh=Kjg83iYSoDUx1nfWz9uvIlSFkWHH4QvuTQfvUaal10o=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=l2RPtibbncv//qkf1f2F7d/K4RLQVbA2nPPQuEsRm2Ob5N7WMtyjn9Yx+mfEJfQiPhu5oB7MV/Vv518/4MHMDaT5Inr6T594n4E77pthBUKi4LuWHwBQ2s0IxMHztMHeAhzCC9J/bUIf14gzOI5qlauneRihGFvSbPVJj4LR7JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx+tHGqydpf5EoAA--.22730S3;
	Thu, 27 Nov 2025 09:39:18 +0800 (CST)
Received: from [10.130.40.41] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxdOTFqydp9I1AAQ--.44181S3;
	Thu, 27 Nov 2025 09:39:18 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
To: Bibo Mao <maobibo@loongson.cn>, Jinyang He <hejinyang@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xi Zhang <zhangxi@kylinos.cn>,
 Xianglai Li <lixianglai@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251125063327.31586-1-yangtiezhu@loongson.cn>
 <658bb477-b3f1-97c1-ab37-5dafcb6215f5@loongson.cn>
 <6cc59312-7cdc-19a5-4d18-e120ea9c7563@loongson.cn>
 <3c0602aa-a8bc-25b9-7d7a-467e04dbc519@loongson.cn>
 <45cf4a09-8895-73fb-c019-1b1f88501eed@loongson.cn>
 <f5dab282-ed95-2161-2367-4a1f7b70e5a8@loongson.cn>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <87730f18-4ad7-2a21-f1bd-483074748b37@loongson.cn>
Date: Thu, 27 Nov 2025 09:39:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <f5dab282-ed95-2161-2367-4a1f7b70e5a8@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxdOTFqydp9I1AAQ--.44181S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ury8GF4rZFWkXFy8urWUWrX_yoW8XrWxpF
	WIyFy5tF4kJFySgrs7Cwn5Zr1YgrsrKr4UGrn7tryUt3Z8Xr1YqF12g3sFvryDZrs5W3Wj
	va1Yvr9F9FW5A3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU82g43UUUUU==

On 2025/11/26 下午5:56, Bibo Mao wrote:
> 
> 
> On 2025/11/26 下午5:09, Tiezhu Yang wrote:
>> Cc: Bibo Mao <maobibo@loongson.cn>
...
>> +#if IS_ENABLED(CONFIG_KVM)
>> +void (*get_kvm_entry_info)(unsigned long *old, unsigned long *new, 
>> unsigned long *size);
>> +EXPORT_SYMBOL_GPL(get_kvm_entry_info);
>> +#endif
> this method mixes kvm and unwind components and it is obvious hack 
> method. If there are other modules which have the similar problem, how 
> to handle it? Add get_MODULE_1_entry_info/get_MODULE_2_entry_info API :)

Currently, there is no other similar issue and something that should not
happen in the future, this is "concrete question concrete analysis" and
"handle special cases with special methods".

> KVM module copy exception function to allocated memory, it breaks unwind 
> rules. KVM can compile exception function in kernel and do not copy the 
> exception functions or LoongArch kernel provides unwind hint APIs to 
> handle it.

That is better if it is possible for KVM, no general API for kernel IMO.

>>   static inline unsigned long bt_address(unsigned long ra)
...
>> +       get_kvm_entry_info = kvm_entry_info;
> Is this API get_kvm_entry_info() general for all modules or kernel 
> components?

No, it is just to get the necessary exception info for this special KVM
case, we can use something like EXPORT_SYMBOL_FOR_KVM_INTERNAL to avoid
the potential misuse if possible (not tested yet).

Thanks,
Tiezhu

