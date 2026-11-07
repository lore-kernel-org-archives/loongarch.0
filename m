Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017788;
	b=UN4pXneEcdyEIGjj/WCxRgpvHlhoxfkl2vG5l7KQ7hXSOunIVxCr7kHN/AmgSnwywMDo
	 yrpBU9HwhF1bjxZiQzamyDc1TiBeQW33KrLMLI3jRhP2xQ2k0d23OdsIJWBIE5nFPR6T4
	 jo17HYos2OgbRNCmajYUWgMH2yYYha4fVMiw4JdaXwqAzpIUT4W9PtqO1KX4GEwq/v1Bz
	 TjqQvY+4N/9IsAVrEI3ouiIE0paVHykYNwG1O28SCv3UO1uXN6/Hs1kVwVrMbHQlcw833
	 hdEc3U3Y9DFJgujlrYeMuYkLj+dG5qyNM9Wm7/RGuF3DV+om/c/X0JTCEu0Ax7JpVkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017788;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=blAcGwT6RrU9VkPRjXupRrOhmEXz2ix0BTNPVck3W3E=;
	b=5s4QiBQ6Qoup2/U5s2TXq/zs7o6QFuP/Pm1Y1gLdr8nNyTGvvji+ECZ5Ik8AAGQVtQ23
	 CLX4Cb824qWvnrylkF+X/UmVUkiamEZZmt+7lxwNn8KMNR/7YUCvF5fYhnAcwjySteoR/
	 a1fT7MKhCLxSuMjQGTACoUq9lLkmtppdnn9py9JeAfR7e8jJxru8/0WUqQ51wtSKu7hu7
	 JcjP7z9GIf+cWH5t44XRXhlOpV1TIJpTE+cYKGHrdyRAT5Ltx5ByT2PPPemIB+LPw9OsK
	 V87co2r0bBhNl2TmwmbKq3+Svc5ZMMQT6DdZxnAD5Bt1EU4SL8CUhUE27GJSBIAxeoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E81A606A32C
	for <loongarch@lists.linux.dev>; Sat,  7 Nov 2026 02:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E81A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxntL4ie5qN0wdAA--.18991S3;
	Sat, 07 Nov 2026 10:16:24 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAxX8_zie5qfOEyAA--.38436S2;
	Sat, 07 Nov 2026 10:16:20 +0800 (CST)
Subject: Re: [PATCH v1 2/2] LoongArch: BPF: Use beqz and bnez instructions for
 trampoline
To: Huacai Chen <chenhuacai@kernel.org>
Cc: bot+bpf-ci@kernel.org, hengqi.chen@gmail.com, loongarch@lists.linux.dev,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, ast@kernel.org,
 andrii@kernel.org, daniel@iogearbox.net, martin.lau@kernel.org,
 eddyz87@gmail.com, yonghong.song@linux.dev, mason@kernel.org,
 ihor.solodrai@linux.dev
References: <20261102072808.23080-3-yangtiezhu@loongson.cn>
 <c3b8e6ae47164ab1a643a1730f0600993de03c8a30e35122a9812ac73d807697@mail.kernel.org>
 <1276eb14-b851-aee7-36ad-d61e2ddd9ba4@loongson.cn>
 <CAAhV-H4GyC5=PvF5yvYnoBpUpU3VTuE8kdNUnApNqvN4vHZfhg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <20f7051a-4f56-7122-c241-93948c465dc9@loongson.cn>
Date: Sat, 7 Nov 2026 10:16:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4GyC5=PvF5yvYnoBpUpU3VTuE8kdNUnApNqvN4vHZfhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxX8_zie5qfOEyAA--.38436S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw4DJr1DJw1fArW3ZFWrJFc_yoW8JFWDpw
	s5JF17KF95tr47Zrs2y3yFga4Fkw1IvFW7W3W5CFyrGw1rAr1IqrWxWryS9FyUXr1I9F1F
	vFyvqFWkWa1UZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8aZX5UUUUU==

On 11/6/26 10:45 PM, Huacai Chen wrote:
> On Tue, Nov 3, 2026 at 10:27 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> On 2026/11/2 下午3:53, bot+bpf-ci@kernel.org wrote:
>>>> LoongArch: BPF: Use beqz and bnez instructions for trampoline
>>>
>>> TL;DR: Commit message only: the claimed branch-overflow risk looks impossible,
>>> since trampolines fit in one page and the old code behaved identically, so the
>>> Fixes: and Cc: stable tags may not be justified.
>>
>> ...
>>
>>> Could the changelog drop the overflow-risk wording, or describe the change
>>> as a cleanup, and could the Fixes: and Cc: stable tags be reconsidered given
>>> that stable-kernel-rules requires a fix for a real bug?
>>
>> Will update the commit message and remove the 'Fixes' and 'Cc: stable'
>> tags. If no more comments, I will send out v2 next week.
> Fixes can be removed but I suggest keep Cc: stable, the overflow risk
> actually exists.

Since the branch overflow is technically impossible under the current
1-page limit of BPF trampoline, I plan to drop the Fixes and Cc: stable
tags in v2 to align with standard upstream cleanup rules.

If you still prefer to backport this for architecture-level defense,
please feel free to append the Cc: stable tag when applying the patch.

Thanks,
Tiezhu

