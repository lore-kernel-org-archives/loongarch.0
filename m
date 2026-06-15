Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAE8223DFB
	for <loongarch@lists.linux.dev>; Mon, 15 Jun 2026 01:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781487698; cv=none; b=IESEoZqaOPUHU3BFxLfNyDh4LO8tZIaNvCVERVcTgXYngC7TyYRC9S53OO2kadtPen2NhXh5OdON5bbnWz8dEyVSOuUA6o5R6fpceficPytRP5hoO5qkOwusbO+IKsGpqD4VA6CNXypx20ChFPIeECYkHeG2uVkr0soTvwNGaKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781487698; c=relaxed/simple;
	bh=l0becU38gb5UdfjnYBQjZDJm2SNhPlgps2cnz5VIK6A=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JBDwUGn+o/I57xcgkx2TBEX4kPfdkb9Byly1YBTd7QK/uYlvROm5DeRkHXbyhz711SwMEgZW0ASSjqe2wEVvDv1Lb0mAMB/6PFMraz3W4KXMAvXhjNVjVXHHBpYxTZlJL8IFFK3XKkfQd8jZd4PTpvAW3Ye/VnRt7sqS4BCci94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxLupMWC9qGCgUAA--.52653S3;
	Mon, 15 Jun 2026 09:41:32 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxD8NJWC9qKJumAA--.54237S3;
	Mon, 15 Jun 2026 09:41:29 +0800 (CST)
Subject: Re: [PATCH v3 0/3] Move thread_info into task_struct for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260612011616.27771-1-yangtiezhu@loongson.cn>
 <CAAhV-H4daHGFoAiXrwcNXj=T1kZm5jRRwd_sCiv7ksjR2ynHgw@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <e23e6781-d39d-d7fa-10ec-8d09349103ed@loongson.cn>
Date: Mon, 15 Jun 2026 09:41:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4daHGFoAiXrwcNXj=T1kZm5jRRwd_sCiv7ksjR2ynHgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxD8NJWC9qKJumAA--.54237S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr1xurW7Wr1Dtw47uFWkKrX_yoWfZrcE9r
	Z7Cr9rGw48Jrs7WayIga4rAr45tFyS9F4rKa1Iq3s2g3s8K3srWF4Sgr1Yyr4fXrZ7GrZI
	gan0ga4fuw1j9osvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUU
	U

On 2026/6/14 上午10:51, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> I have queued this series for 7.2, does the below series depend on this one?
> 
> https://lore.kernel.org/loongarch/20260521125636.26744-1-yangtiezhu@loongson.cn/T/#t

This is independent on CONFIG_THREAD_INFO_IN_TASK.

> https://lore.kernel.org/loongarch/20260428080051.20938-1-yangtiezhu@loongson.cn/T/#t

This is dependent on CONFIG_THREAD_INFO_IN_TASK.

But anyway, I plan to send new version for the above two series of
selftests once this "Move thread_info into task_struct for LoongArch"
series is merged into the mainline, maybe after 7.2-rc1.

Because the code under selftests need to be updated, for example,
it can use bpf_get_current_task_btf()->thread_info.preempt_count
for get_preempt_count(), and it should use ld.wu rather than ld.w
for bpf_get_smp_processor_id().

Thanks,
Tiezhu

