Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976642DAFDF
	for <loongarch@lists.linux.dev>; Thu,  2 Apr 2026 02:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775098141; cv=none; b=rxfR1Sb2rFu54hyzMVMSbbFud75tw2U452hf/VbSHucJDmhqUvh3rIuxMYxSHV88rsDyTQjeiJliVt1SA/3nC8myEqtUKogHWQ35s6tRQUGqxAgNYEGPSbs9TTtel/rld4yIn71l7q/fey2qEE+2T/V/7NfF4v+KEDbtrqcrKlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775098141; c=relaxed/simple;
	bh=nvdPCKZmii8Q5beKHgefCNimY7ElhJYekIGNQA4QKCM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=NaAg9QlvQ+OPAC9P6G7MzVtRcqICQKgTix+e0BRDfYjEqPbsa4aYaOShODTP+343LtFkvU3ly1rIrJNd0zkVtXVXwnD2/56LXgUmijsvH0BQSVZ+m9v9KnIVqbUhQNh1jNZV6GUer5WAP7HwrvGXyCoZHHYNFM7zTV2cKfHc/Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx58EQ2c1p4xAhAA--.15729S3;
	Thu, 02 Apr 2026 10:48:48 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxGMEH2c1p4CRjAA--.44258S3;
	Thu, 02 Apr 2026 10:48:39 +0800 (CST)
Subject: Re: [PATCH v1 1/5] LoongArch: Define format for AM{SWAP/ADD}.{B/H},
 DBAR and BSTRINS.D
To: bot+bpf-ci@kernel.org, chenhuacai@kernel.org, hengqi.chen@gmail.com
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
 daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com,
 yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
References: <20260401071206.5506-2-yangtiezhu@loongson.cn>
 <6089c3c90bd2f2cf2848a39fc0d30219d0f3f95f9c74257a19d01de053eb1c44@mail.kernel.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <3b8ef23a-e324-4ad8-430c-e02adca44a1c@loongson.cn>
Date: Thu, 2 Apr 2026 10:48:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6089c3c90bd2f2cf2848a39fc0d30219d0f3f95f9c74257a19d01de053eb1c44@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxGMEH2c1p4CRjAA--.44258S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZF48Jr4ruF1rZF4fJF1DJwc_yoWkCrc_Cw
	sFgFy5Gr48AanYvw1DG3Z5Xr45Aa1fKFnaya4DK39rAFy5Xr13twsxJa4fAryYqF1ftFZa
	yw4xZFnF9w12qosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUba8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8aZX5UUUUU==

On 2026/4/1 下午4:23, bot+bpf-ci@kernel.org wrote:
>> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
>> index 657bbae6c1c7..93466fc7d33d 100644
>> --- a/arch/loongarch/kernel/cpu-probe.c
>> +++ b/arch/loongarch/kernel/cpu-probe.c
>> @@ -177,6 +177,10 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
>>   		c->options |= LOONGARCH_CPU_LAM;
>>   		elf_hwcap |= HWCAP_LOONGARCH_LAM;
>>   	}
>> +	if (config & CPUCFG2_LAM_BH) {
>> +		c->options |= LOONGARCH_CPU_LAM_BH;
>> +		elf_hwcap |= HWCAP_LOONGARCH_LAM_BH;
>> +	}
> 
> Should there be a corresponding entry in the "Features" line of
> /proc/cpuinfo for the new lam_bh capability?
> 
> Every other feature that sets elf_hwcap in cpu_probe_common() also
> has a matching seq_puts() in show_cpuinfo() in proc.c:
> 
> arch/loongarch/kernel/proc.c:show_cpuinfo() {
>      ...
>      if (cpu_has_lam)
>              seq_puts(m, " lam");
>      if (cpu_has_scq)
>              seq_puts(m, " scq");
>      ...
> }
> 
> The new cpu_has_lam_bh is missing from this list.

Yes, I think so, thank you.
I will wait for more comments before sending v2.

Thanks,
Tiezhu

