Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D165026B
	for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712914138; cv=none; b=F61bOlxjC0qhkYCxL5l2o7qLK7Q3L7U0hfxSJtFSA19+7wid3Az5c3MQWuwOUy9yb7IQwe4faSdoIK5A3Frx6G/yRmnlPB6xOmzq0yUN8FuNTWHaSGpM+gRDNF8Evgdoc9kN1gpcEakkaKzvODfEzsBO2qLvMCxLQP3Pmy7dtoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712914138; c=relaxed/simple;
	bh=3W/lvW+cd509tmRSShTncTH2iQD2ypL2DTjIec6w4UE=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=W/jZ4/CJFjEhrRT6k1SJGVEkY5aDeg5pOQz/rJmPUf4ueyg0QSgPbiGfarK27WkR6yKn+UKpJ/bPkN50l08s/ToLuin/ScMhP3/f6k8suMKrgkKzj3BIXNpLQAV7jLgo+MzX0k73+L6LmLQ5OaWvPdH8N2Nm02eSAvUHrOpfMi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxG+nW_hhmTFMmAA--.3562S3;
	Fri, 12 Apr 2024 17:28:54 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxfRPU_hhm_KJ4AA--.2797S3;
	Fri, 12 Apr 2024 17:28:53 +0800 (CST)
Subject: Re: [PATCH v3 2/4] LoongArch: Refactor get_acpi_id_for_cpu() related
 code
To: Huacai Chen <chenhuacai@kernel.org>
References: <20240411010510.22135-1-yangtiezhu@loongson.cn>
 <20240411010510.22135-3-yangtiezhu@loongson.cn>
 <CAAhV-H73d5hVM+anfHhTFHjWDmVtC2TJdxU9hANJvQgm-E3g6w@mail.gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Marc Zyngier <maz@kernel.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <45a3ef9b-54f2-cea6-5902-d9681fad6a48@loongson.cn>
Date: Fri, 12 Apr 2024 17:28:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H73d5hVM+anfHhTFHjWDmVtC2TJdxU9hANJvQgm-E3g6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxfRPU_hhm_KJ4AA--.2797S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFyDGry7XryfKw4xAF18Zwc_yoW8Cryfpa
	ykt343trs2y34xuw4kGw13Gr15tr1DWFyIvF4IkFWrAa1kur15tFs7Ka429FZ8Wa18Gr4a
	vrn3ta4j9a1UCabCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4AhLUUUUU



On 04/12/2024 12:17 PM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> On Thu, Apr 11, 2024 at 9:05 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> Currently, cpu_logical_map(cpu) is defined as __cpu_logical_map[cpu]
>> in arch/loongarch/include/asm/smp.h and __cpu_logical_map[] is defined
>> in arch/loongarch/kernel/smp.c, that is to say, cpu_logical_map(cpu) is
>> vaild only under CONFIG_SMP, the implementation of get_acpi_id_for_cpu()
>> which calls cpu_logical_map(cpu) is not suitable for the case of non-SMP,
>> so refactor get_acpi_id_for_cpu() related code to make it work well for
>> both SMP and non-SMP.
> But you implement cpu_logical_map(cpu) for non-SMP in the 4th patch, right?

The initial aim is to make get_acpi_id_for_cpu() only related with
acpi stuff and referenced the following riscv code, this patch can
be dropped if you think it is better to only define cpu_logical_map(cpu)
under !CONFIG_SMP, I am not sure whether it needs to keep the changes
in acpi.c at least.

static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, 
const unsigned long end)
{
	struct acpi_madt_rintc *rintc = (struct acpi_madt_rintc *)header;
	int cpuid;

	if (!(rintc->flags & ACPI_MADT_ENABLED))
		return 0;

	cpuid = riscv_hartid_to_cpuid(rintc->hart_id);
	/*
	 * When CONFIG_SMP is disabled, mapping won't be created for
	 * all cpus.
	 * CPUs more than num_possible_cpus, will be ignored.
	 */
	if (cpuid >= 0 && cpuid < num_possible_cpus())
		cpu_madt_rintc[cpuid] = *rintc;

	return 0;
}

struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
{
	return &cpu_madt_rintc[cpu];
}

u32 get_acpi_id_for_cpu(int cpu)
{
	return acpi_cpu_get_madt_rintc(cpu)->uid;
}

https://elixir.bootlin.com/linux/v6.9-rc3/source/arch/riscv/kernel/acpi.c#L194

Thanks,
Tiezhu

