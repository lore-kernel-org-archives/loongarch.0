Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D70C1607AB
	for <loongarch@lists.linux.dev>; Thu, 24 Jul 2025 01:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753321290; cv=none; b=sk29Ue0d45VHRfpCLMN0f2ABoQNCbIMbfTeqdnzPQIjzCR1NYAKN5Jl49Qac98t8SmD7IY6S2j4h93wHYsBASq69e8FzAz7g9LdFQQufEftL5qsnReTuHenFTJHHf8lzXYptH6I48W0PNGLyHUuO9a0ljLDr91+QyFuyWu/9QFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753321290; c=relaxed/simple;
	bh=1BXpZI4scZTyVma5PgiR4xOt+Q2ng527W4S4xuCME2Y=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=PVdjCbnTLKx4GvJ1C3Wkx2VmSDdurms7cqmeIczb6JxvW86RdEhmCQMf1gcEIw+YOC2uoj3RKPcT2eziRbrBPZFvMbNKc8pCv0NRzjU+3iA5CCkrI9IG0ytWiQjt/trqcehfUGFASdu618dT2LLI8yNjTK44JhfMv5tycoA4AT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Cx_eJDj4FoGcswAQ--.58460S3;
	Thu, 24 Jul 2025 09:41:23 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxocJAj4FotAYkAA--.53925S3;
	Thu, 24 Jul 2025 09:41:22 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Move kvm_iocsr tracepoint out of generic
 code
To: Steven Rostedt <rostedt@goodmis.org>, LKML
 <linux-kernel@vger.kernel.org>,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
 kvm@vger.kernel.org, loongarch@lists.linux.dev
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <20250722094734.4920545b@gandalf.local.home>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <2c2f5036-c3ae-3904-e940-8a8b71a65957@loongson.cn>
Date: Thu, 24 Jul 2025 09:39:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250722094734.4920545b@gandalf.local.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxocJAj4FotAYkAA--.53925S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAr43urW3Kr17Cr4Uuw4xXwc_yoW5uF4kpF
	17ArZIgr4xKrs7A34fZwn5Krsxu3s5uFy7t3srWrWkCF48Ar4rGr1qvrWkt3sIy3sYka4x
	tF1vvryUGayUZ3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zw
	Z7UUUUU==



On 2025/7/22 下午9:47, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> The tracepoint kvm_iocsr is only used by the loongarch architecture. As
> trace events can take up to 5K of memory, move this tracepoint into the
> loongarch specific tracing file so that it doesn't waste memory for all
> other architectures.
> 
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>   arch/loongarch/kvm/trace.h | 35 +++++++++++++++++++++++++++++++++++
>   include/trace/events/kvm.h | 35 -----------------------------------
>   2 files changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/loongarch/kvm/trace.h b/arch/loongarch/kvm/trace.h
> index 145514dab6d5..d73dea8afb74 100644
> --- a/arch/loongarch/kvm/trace.h
> +++ b/arch/loongarch/kvm/trace.h
> @@ -115,6 +115,41 @@ TRACE_EVENT(kvm_exit_gspr,
>   			__entry->inst_word)
>   );
>   
> +#define KVM_TRACE_IOCSR_READ_UNSATISFIED 0
> +#define KVM_TRACE_IOCSR_READ 1
> +#define KVM_TRACE_IOCSR_WRITE 2
> +
> +#define kvm_trace_symbol_iocsr \
> +	{ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
> +	{ KVM_TRACE_IOCSR_READ, "read" }, \
> +	{ KVM_TRACE_IOCSR_WRITE, "write" }
> +
> +TRACE_EVENT(kvm_iocsr,
> +	TP_PROTO(int type, int len, u64 gpa, void *val),
> +	TP_ARGS(type, len, gpa, val),
> +
> +	TP_STRUCT__entry(
> +		__field(	u32,	type	)
> +		__field(	u32,	len	)
> +		__field(	u64,	gpa	)
> +		__field(	u64,	val	)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->type		= type;
> +		__entry->len		= len;
> +		__entry->gpa		= gpa;
> +		__entry->val		= 0;
> +		if (val)
> +			memcpy(&__entry->val, val,
> +			       min_t(u32, sizeof(__entry->val), len));
> +	),
> +
> +	TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
> +		  __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
> +		  __entry->len, __entry->gpa, __entry->val)
> +);
> +
>   #define KVM_TRACE_AUX_SAVE		0
>   #define KVM_TRACE_AUX_RESTORE		1
>   #define KVM_TRACE_AUX_ENABLE		2
> diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
> index 8b7252b8d751..b282e3a86769 100644
> --- a/include/trace/events/kvm.h
> +++ b/include/trace/events/kvm.h
> @@ -156,41 +156,6 @@ TRACE_EVENT(kvm_mmio,
>   		  __entry->len, __entry->gpa, __entry->val)
>   );
>   
> -#define KVM_TRACE_IOCSR_READ_UNSATISFIED 0
> -#define KVM_TRACE_IOCSR_READ 1
> -#define KVM_TRACE_IOCSR_WRITE 2
> -
> -#define kvm_trace_symbol_iocsr \
> -	{ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
> -	{ KVM_TRACE_IOCSR_READ, "read" }, \
> -	{ KVM_TRACE_IOCSR_WRITE, "write" }
> -
> -TRACE_EVENT(kvm_iocsr,
> -	TP_PROTO(int type, int len, u64 gpa, void *val),
> -	TP_ARGS(type, len, gpa, val),
> -
> -	TP_STRUCT__entry(
> -		__field(	u32,	type	)
> -		__field(	u32,	len	)
> -		__field(	u64,	gpa	)
> -		__field(	u64,	val	)
> -	),
> -
> -	TP_fast_assign(
> -		__entry->type		= type;
> -		__entry->len		= len;
> -		__entry->gpa		= gpa;
> -		__entry->val		= 0;
> -		if (val)
> -			memcpy(&__entry->val, val,
> -			       min_t(u32, sizeof(__entry->val), len));
> -	),
> -
> -	TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
> -		  __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
> -		  __entry->len, __entry->gpa, __entry->val)
> -);
> -
>   #define kvm_fpu_load_symbol	\
>   	{0, "unload"},		\
>   	{1, "load"}
> 
Reviewed-by: Bibo Mao <maobibo@loongson.cn>

