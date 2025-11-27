Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E331A9FAB
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 01:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764207183; cv=none; b=j22WTJ5iduizurdceFrZSI97eW5Hr8+stwWMHS9rsewJBWYdog9P9i7VcDRjRwAugG3+3pnuc8bbFXyjltETX/HH9T+yi+ybzAtck1mXUAsdSOEnb6JMazoFbPJReHbhpN/RLpZ8CAkYpyz8UAGxgIOrNTyogq3MR6UlJj/wspI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764207183; c=relaxed/simple;
	bh=0rjtHuE2Ikibzw+2icHYM4UhlXJJIgwRgw/nlohhmA0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hWWuEQFRmcnA0ECd6+LlUR63/aXXMT/cS5Hqep3NJ+kmmh9dZezBXt9x295ZgT7T1zXwKZ2MSKgrSeeIcCdymCv3/kGkOrbtRvxsU2ZbxUkDPpGdi8BGTLNwoqK3DNLvSzU5LOu4/BAZJ34hAZ6VD9yef3ar9z+Q1PkFUWg9Moc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxxtBKqidpwJAoAA--.20171S3;
	Thu, 27 Nov 2025 09:32:59 +0800 (CST)
Received: from [10.130.40.41] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxecBJqidpkIxAAQ--.19719S3;
	Thu, 27 Nov 2025 09:32:58 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jinyang He <hejinyang@loongson.cn>, Xi Zhang <zhangxi@kylinos.cn>,
 Xianglai Li <lixianglai@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Bibo Mao <maobibo@loongson.cn>
References: <20251125063327.31586-1-yangtiezhu@loongson.cn>
 <658bb477-b3f1-97c1-ab37-5dafcb6215f5@loongson.cn>
 <6cc59312-7cdc-19a5-4d18-e120ea9c7563@loongson.cn>
 <3c0602aa-a8bc-25b9-7d7a-467e04dbc519@loongson.cn>
 <45cf4a09-8895-73fb-c019-1b1f88501eed@loongson.cn>
 <CAAhV-H6pQytDg_fKE7rpC2OogWYGEsHUxUMKLqsvtfSPWMWvaA@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <a4d22c70-4443-f244-f39b-3948fb6aabd0@loongson.cn>
Date: Thu, 27 Nov 2025 09:32:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6pQytDg_fKE7rpC2OogWYGEsHUxUMKLqsvtfSPWMWvaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxecBJqidpkIxAAQ--.19719S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jr1kCF1UZr1xCw13JF48Zrc_yoWxtwb_Cw
	4qqr17Cr1qvrn5Ca1UK342qFyUXa9rXF1kXF1DXw12vw4Ika4fJryxKryUW3yfXa1DAFsI
	vF9xWr9xCr1j9osvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbf8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU88Ma5UUUUU==

On 2025/11/26 下午5:27, Huacai Chen wrote:
> On Wed, Nov 26, 2025 at 5:09 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
...
>> +#if IS_ENABLED(CONFIG_KVM)
>> +void (*get_kvm_entry_info)(unsigned long *old, unsigned long *new,
>> unsigned long *size);
>> +EXPORT_SYMBOL_GPL(get_kvm_entry_info);
>> +#endif
> Define in unwind.c then you don't need to duplicate it.

OK, makes sense.

>>    unsigned long unwind_get_return_address(struct unwind_state *state)
...
>> +#if IS_ENABLED(CONFIG_KVM)
>> +       unsigned long old, new, size;
> Define them in the if block, and you can consider removing all "#if
> IS_ENABLED(CONFIG_KVM)".

OK, will do it in the next version.

Thanks,
Tiezhu

