Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461E929BD91
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 07:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764228611; cv=none; b=BDUsvmyFjWe9v5EbUvXGFk+mZBKvP9CJSLFvc+eZUS9Rj40/c1myoY8521kuFhgWjJZiEnhX60gvgVy3U0j4sUUt9s+D76pjczWBFuQYHaGlxMHrEuHiHtikqlBx1FYXBq6fg3JHTNXAwBh3duBUUb0QEvKTTX58N0fZda9uKbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764228611; c=relaxed/simple;
	bh=MUKE6TsfdpMf+oCF6KUlC/9xAx4fBlEudOWLd3Vkodk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=lQ2nqzL0/PidplIF1DsOWVaybiPIxJTEMRwPvLqC5nkmQF8PyNeJKyl9do8QmYAToA0hkbr1OP1iqFUOYBOFMO3eGsTKFoZWpU6VW0rOrd2k6JyySOx6GRTyppKWF6mMSUhSoBu+gpQ3EzpvgKxPMXid+rbRt+LLNJB4wKinINg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxndL5_SdpSaYoAA--.21388S3;
	Thu, 27 Nov 2025 15:30:01 +0800 (CST)
Received: from [10.130.40.41] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxqcD3_Sdpc8lAAQ--.20894S3;
	Thu, 27 Nov 2025 15:30:00 +0800 (CST)
Subject: Re: [PATCH 0/5] LoongArch: BPF features and fixes
To: Huacai Chen <chenhuacai@kernel.org>, Hengqi Chen <hengqi.chen@gmail.com>
Cc: vincent.mc.li@gmail.com, loongarch@lists.linux.dev
References: <20251124055642.1591-1-hengqi.chen@gmail.com>
 <CAAhV-H6rrpgBF+bMpEvsJyq0F7sdWisGSwTbuf=ZBhi4XD-5jw@mail.gmail.com>
 <CAEyhmHSntgSQdAOksd6YUsHh0UXJS7XMmSHAZmRDQ5uEzDU0JQ@mail.gmail.com>
 <CAAhV-H5Vab3bwgT2LdGyNB4ipzhnS+JW7PdcOSmNm4JZ30tWTg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <fc62bac6-b212-3aed-1536-aee8a60d2f0a@loongson.cn>
Date: Thu, 27 Nov 2025 15:29:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5Vab3bwgT2LdGyNB4ipzhnS+JW7PdcOSmNm4JZ30tWTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxqcD3_Sdpc8lAAQ--.20894S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZryrWry3Aw47tr1DXrW3CFX_yoWfWrXE9F
	98urnrCw18GF48G3ZakwnxZrn8XFyxuw1ftw1qg34fZas3t3s8Jws3u3savw1xAw4kArna
	9FnYvFs3Zry2gosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbakYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnI
	WIevJa73UjIFyTuYvjxU2DUUUUUUU

On 2025/11/27 下午2:44, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> On Mon, Nov 24, 2025 at 3:49 PM Hengqi Chen <hengqi.chen@gmail.com> wrote:
>>
>> On Mon, Nov 24, 2025 at 2:31 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>>>
>>> Hi, Hengqi,
>>>
>>> I think this is the successor of
>>> https://lore.kernel.org/loongarch/20251006053323.193581-1-hengqi.chen@gmail.com/T/#t
>>>
>>> Right?
>>>
>>
>> Right, sorry for the long delay.
> Could you please help to review this series?

I trust Hengqi and I am OK with this series in general with
a quick look.

For the two functions sign_extend() and emit_abi_ext(), I
have no strong opinion, I do not want to respin the patch
since the merge window is coming soon, it does not affect
the correctness, so we can refine the code later if there
is a better way.

Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Thanks,
Tiezhu

