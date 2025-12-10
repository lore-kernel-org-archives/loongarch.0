Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1950022128B
	for <loongarch@lists.linux.dev>; Wed, 10 Dec 2025 01:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765330140; cv=none; b=BvGwiztfoOtuOevTrpVE4SUuQLZbOW+14XpbFd4QlN5D0ZH5XK/IBnvknvNBiQBncPLcDk/HbhvBBe3skZZS+kXcgH0K8pz537kD0JAoius+zeT3VwQ0AwtmCM5xnkCCuME+wuesBilI1D+STki+w0zsoHYJzs023IPg+lnLrb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765330140; c=relaxed/simple;
	bh=YDORYGUpV2mBuFqR+8Gh7gvtcWY0S2eH8lW6qVNO828=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=dpkqHgBIniuK43zlxzB20orsKVcrS4SMfsnac5/lDfUy1FAjRs35ZkA2LrGPlUIxFwlu3EUhoBYj6FJFhskoIKywuv8JEKVzBP+007uJlQU8xy9gzS2iQ1ArO/X9WAroY1wHHL8UHLiW7hXUrMBNmA7ffyizCKRde4gxEi3SZiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxjdLXzDhpN90sAA--.26025S3;
	Wed, 10 Dec 2025 09:28:55 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxysDWzDhpBqJHAQ--.36238S3;
	Wed, 10 Dec 2025 09:28:54 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Remove unnecessary checks in bt_address()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251209061809.15994-1-yangtiezhu@loongson.cn>
 <CAAhV-H6zjWXjjuoOkRov4886E82QRH=3NnkhP2e4hroSJr1UXg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <92bf0e88-da14-20ce-137a-3e7777e19af3@loongson.cn>
Date: Wed, 10 Dec 2025 09:28:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6zjWXjjuoOkRov4886E82QRH=3NnkhP2e4hroSJr1UXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxysDWzDhpBqJHAQ--.36238S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JF45Gr1kGF1rXr1DJF1kZwc_yoWfJFXEga
	1kXr15uw1kWr1fG3WrKrZ5Zr9rJa4jkrZ5KF1UX397t3sxGa9rZrna9r9Yvr4DJw43KrW3
	KrnrG3Wq93sruosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr
	1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU82-e7UU
	UUU==

On 2025/12/9 下午4:30, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> On Tue, Dec 9, 2025 at 2:18 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
...
>>          extern unsigned long eentry;
>>
>> -       if (__kernel_text_address(ra))
>> -               return ra;
>> -
>> -       if (__module_text_address(ra))
>> -               return ra;
> I think the correct way is to remove the __module_text_address()
> condition but keep the __kernel_text_address() condition. Then return
> 0 at the end of this function, and remove the __kernel_text_address()
> condition out of this function.

It can not remove the check of __kernel_text_address() after calling
bt_address() because it needs to validate the calculated address for
exception, then no need to keep the __kernel_text_address() condition
in bt_address() because it will check the PC outside bt_address().

Thanks,
Tiezhu

