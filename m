Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1EBEEA8
	for <loongarch@lists.linux.dev>; Wed,  5 Nov 2025 03:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762312365; cv=none; b=cBUPVyWAKNaZg5ZlMGa0yhJ8PJ7vI0oGNlBLUvyY9U6eOBU8RiKaC52ix5p7tuN9U7y60ot+0qlsYwentl1CM5Rdtrtj8XsLegmIXCWLi61KwtgMWvZGPjhL6ELuOmVbCicD9QLfBKo3y9FuOWFQygBmy1gPy2QYm9UsYP7HNpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762312365; c=relaxed/simple;
	bh=Cc8tcOLIYtLa02HjBXT/S5QLaMDyVzaGmWUsKoqT0uM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=N9QRj2R+16CxQVkwSqDf8UKcM71c8yGel8kZVcvWS8O+jZtKLm4sJi/plWcO3iu/jlL8ZAkRfkfsU8uZ0YJaolPu/MgTG2z6LS1Lqnw8icR2FfKcxMMPs1SEiOHLulNORzCY7eVIi/UTbcZHmIRZYQkAIKMg3oqRQWLu2ApoXzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx1tCmwAppLQgfAA--.1867S3;
	Wed, 05 Nov 2025 11:12:39 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+SkwAppoaAnAQ--.58995S3;
	Wed, 05 Nov 2025 11:12:37 +0800 (CST)
Subject: Re: [PATCH] LoongArch: ptrace: Merge ptrace_hbp_set_*()
To: Huacai Chen <chenhuacai@kernel.org>, Bill Tsui <b10902118@ntu.edu.tw>
Cc: oleg@redhat.com, kernel@xen0n.name, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251029153649.33345-1-b10902118@ntu.edu.tw>
 <CAAhV-H5E79jZ9rMYyP3h+KLX5rDGcB-Ec8WqyAhPC-pvuvv5UQ@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <429e94ee-ee77-3a5c-a2f7-c0d027fb7c4c@loongson.cn>
Date: Wed, 5 Nov 2025 11:12:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5E79jZ9rMYyP3h+KLX5rDGcB-Ec8WqyAhPC-pvuvv5UQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+SkwAppoaAnAQ--.58995S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWrZFWfGw1rKry7CrykAw4rCrX_yoW8JF1rp3
	yIyrs0kFs8tw40kw1xKw10qa4j9r1UKa45C3s5Xa4rZ3WY9Fn3AFWI9ay3KayUGry0934I
	vrZxZrZ3uFy5uacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwmhFDUUU
	U

Hi Bill,

On 2025/11/5 上午8:57, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> On Wed, Oct 29, 2025 at 11:38 PM Bill Tsui <b10902118@ntu.edu.tw> wrote:
>>
>> In hw_break_set(), those functions actually can be combined into one.
>> This eliminates intermediate calls to modify_user_hw_breakpoint() that
>> may leave hardware registers in a partially updated state.
>>
>> This redundancy was originally found in ARM ptrace, where it caused
>> non-4-byte address alignment checks to fail.
>>
>> Link:
>> https://lore.kernel.org/all/20251018133731.42505-2-b10902118@ntu.edu.tw/
>>
>> The LoongArch implementation appears to have been derived from ARM,
>> so this refactor helps avoid the same issue and simplifies future
>> maintenance.
> What do you think about it?

Can you describe directly what is wrong with the current code
on LoongArch? Please do not show the ARM's under-review patch
link in the commit message.

Does this patch fix real problem? If there is a test case to
reproduce the problem, please add it into the commit message.

If there is no functional change, just to refactor the code or
avoid the potential issues, please give a explicit description.
We will test GDB to see whether there is a regression.

Thanks,
Tiezhu

