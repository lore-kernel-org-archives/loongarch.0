Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0482132A3C5
	for <loongarch@lists.linux.dev>; Fri, 30 Jan 2026 08:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769763162; cv=none; b=pCrhxmZhQcqD9I2hXOVcDCbwx0S/dSIG7NNmT/K4E87N3q0KT81W9VKGDnOSEYK1SZd6w8FoKAsZG/8KOs0XQWLifdTdvpP5/MFrEcOqp7WRW9FPKEXUsxUX2kTezm+O9y1vYkvQD+ksJlibbkZP8ihDwtZLzbPFx/BTpe7q6hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769763162; c=relaxed/simple;
	bh=Ns6qFKSvVn3YlOzeJGPav2vgXald/xUZ51czyM4Kp9w=;
	h=From:Subject:To:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=MYLw3H3p6aiJmD6IjPkx2sCop586XGRUBZTGTio+r0+wCx12MsnnLESHQ/nNrlSHopvfPTnRg+tgXqqiEStexnCnKUQYPR7Jg900kFfR0RfNLy7yHcbqul73n9kwqgoELoGckV1xffGK0JAmdsZ6ueMB9HfqzfltLbUJylamp5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8Axy8JUcXxp8TYOAA--.46098S3;
	Fri, 30 Jan 2026 16:52:37 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowJDxSMFRcXxpKEg6AA--.31620S3;
	Fri, 30 Jan 2026 16:52:35 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v9 2/4] irqchip/irq-loongson.h:irq-loongson.h preparation
 for Redirect irqchip
To: loongarch@lists.linux.dev
References: <20260130025941.2140582-1-zhangtianyang@loongson.cn>
 <20260130025941.2140582-3-zhangtianyang@loongson.cn> <875x8jmsa8.ffs@tglx>
Message-ID: <1eb32de8-e1ba-c7fe-b6ab-92b8f6c4e65b@loongson.cn>
Date: Fri, 30 Jan 2026 16:50:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <875x8jmsa8.ffs@tglx>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxSMFRcXxpKEg6AA--.31620S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZFW5WF1xCF4ftw4xJrWDAwc_yoWDWFXEgF
	yFvr1xGF1DGFZ7X343GwsxZFWfGry5GFyqyrW5ZF12qas5JFs5Cr1qq3s2qrWrXayIqFna
	grs5Xws5A34a9osvyTuYvTs0mTUanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbg8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
	Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUJVWUXwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4U
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU1RpBD
	UUUUU==

Hi, Thomas

ÔÚ 2026/1/30 ÏÂÎç4:14, Thomas Gleixner Ð´µÀ:
> On Fri, Jan 30 2026 at 10:59, Tianyang Zhang wrote:
>
> The subject line is broken and incomprehensible. Something like:
>
>      irqchip/irq-loonarch-avec: Prepare for interrupt redirection support
>
> is concise and gives context.
>
>> Adjusted definitions and macro from loongson-avec.c to irq-loongson.h,
>> including:
>> 1 marco AVEC_MSG_OFFSET
>> 2 struct avecintc_data
>> 3 Make avecintc_sync public
> That's not a change log because it only tells _what_ the patch is doing,
> but not _why_. Enumerating the details of what is moved is a pointless
> exercise because that can bee seen from the diff itself.
>
> So you want something like:
>
>    Interrupt redirection support requires a new interrupt chip, which
>    needs to share data structures, constants and functions with the AVEC
>    code.
>
>    Move them to the header file and make the required functions public.
>
> See?

OK I got it,I will rewrite and explain these reasons.

Thanks

