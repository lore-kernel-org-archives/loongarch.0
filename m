Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B57116A360
	for <loongarch@lists.linux.dev>; Wed, 29 May 2024 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716976606; cv=none; b=mFtRlJpbKVdbFId7B3dmDIExrp47jP73ZMauq6J4iT7TeC0nVyyhzY+knasmEHj4aGkxS+MnOxQH1R/hqFO7bY+wbRgt6xieYzdj+bZe55WMqZCkHWg2w+q6/a8zIXJEOOWrV3S3klJYL8skczyPkAJ0nCmvPIlHrlDx3ts9x5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716976606; c=relaxed/simple;
	bh=hae5iClJPYSZdE+AeoUdpY0Z0NvFNQSjTbTB1lTd+fQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=twd3R6sHaYGQhtgX3CR9hbmpNkizDHras7Util+kVRi0lfewmzl72T6gt86PnBgvRaQOZFtn10NUKgH9By5AR3x2P9dLIBKxNteCZbMKi90oaHMaHhak+8nwZDORLE3dTjb+Sn1WYkHnzKtu7R8CyxckaOIFsrcv33zn6okt554=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8BxrOrV+1ZmwxYBAA--.4622S3;
	Wed, 29 May 2024 17:56:37 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxNMXS+1ZmZtkMAA--.23116S3;
	Wed, 29 May 2024 17:56:36 +0800 (CST)
Subject: Re: [PATCH 1/3] LoongArch: ptrace: Fix watchpoint setting error
To: Hui Li <lihui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20240529013019.15235-1-lihui@loongson.cn>
 <20240529013019.15235-2-lihui@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <6581186e-28f9-b77e-2ca4-590f6c262612@loongson.cn>
Date: Wed, 29 May 2024 17:56:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240529013019.15235-2-lihui@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8DxNMXS+1ZmZtkMAA--.23116S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW3WrW5KF43JrWxCF4kAw48Zrc_yoW7KFW5pr
	ZrZrn5tr4DGry7W3Zrtws8Ca13Z3srWrW2g34Yq34YkrZIqrWfWr10kr9Fqr4Fk34kG34S
	qFySgF1aga1UZwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ36c02F40EFcxC0VAKzVAqx4xG6I80ewCIccxYrVCFb4Uv73VFW2AGmfu7
	bjvjm3AaLaJ3UjIYCTnIWjp_UUUYh7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4
	CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0
	c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2
	IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
	GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r126r1DMIIYY7kG6xAYrwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIY
	CTnIWIevJa73UjIFyTuYvjxUkYZXUUUUU


On 2024-05-29 09:30, Hui Li wrote:
> In the current code, when debugging the following code using gdb,
> "invalid argument ..." message will be displayed.
>
> lihui@bogon:~$ cat test.c
>    #include <stdio.h>
>    int a = 0;
>    int main()
>    {
>      printf("start test\n");
>      a = 1;
>      printf("a = %d\n", a);
>      printf("end test\n");
>      return 0;
>    }
> lihui@bogon:~$ gcc -g test.c -o test
> lihui@bogon:~$ gdb test
> ...
> (gdb) start
> ...
> Temporary breakpoint 1, main () at test.c:5
> 5        printf("start test\n");
> (gdb) watch a
> Hardware watchpoint 2: a
> (gdb) c
> Continuing.
> Invalid argument setting hardware debug registers
>
> The root cause is that the existing kernel ptrace interface
> has some issues on watchpoint argument parsing and setting.
> It mainly includes the two types of issues.
>
> 1. Some incorrect judgment condition existed in ptrace watchpoints
>     argument parsing, causing -EINVAL to be returned.

Which judgment? I see we return -EINVAL if !ctrl.len while 
LOONGARCH_BREAKPOINT_LEN_8  is zero.

I think the commit message should clearly point out this/these judgment.

And I think the test log is too complex.


>
> 2. The watchpoint argument was not set correctly due to unnecessary
>     addr offset.

Agree. The address is incorrect by add offset in ptrace_hbp_fill_attr_ctrl.


>
> Modify the relevant code to solve the above problem. Ensure the watchpont
> argument is set correctly.
>
> All changes according to the LoongArch Reference Manual:
> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints
>
> with this patch:
>
> lihui@bogon:~$ gdb test
> ...
> (gdb) start
> ...
> Temporary breakpoint 1, main () at test.c:5
> 5        printf("start test\n");
> (gdb) watch a
> Hardware watchpoint 2: a
> (gdb) c
> Continuing.
> start test
> a = 1
> ...
>
> Signed-off-by: Hui Li <lihui@loongson.cn>
> ---
>   arch/loongarch/include/asm/hw_breakpoint.h |  2 +-
>   arch/loongarch/kernel/hw_breakpoint.c      | 20 ++++----------
>   arch/loongarch/kernel/ptrace.c             | 32 ++++++++++------------
>   3 files changed, 21 insertions(+), 33 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/hw_breakpoint.h b/arch/loongarch/include/asm/hw_breakpoint.h
> index 21447fb1efc7..a8ce580f4fc6 100644
> --- a/arch/loongarch/include/asm/hw_breakpoint.h
> +++ b/arch/loongarch/include/asm/hw_breakpoint.h
> @@ -101,7 +101,7 @@ struct perf_event;
>   struct perf_event_attr;
>   
>   extern int arch_bp_generic_fields(struct arch_hw_breakpoint_ctrl ctrl,
> -				  int *gen_len, int *gen_type, int *offset);
> +				  int *gen_len, int *gen_type);
>   extern int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
>   extern int hw_breakpoint_arch_parse(struct perf_event *bp,
>   				    const struct perf_event_attr *attr,
> diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
> index fc55c4de2a11..2d311aff91af 100644
> --- a/arch/loongarch/kernel/hw_breakpoint.c
> +++ b/arch/loongarch/kernel/hw_breakpoint.c
> @@ -283,7 +283,7 @@ int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw)
>    * to generic breakpoint descriptions.
>    */
>   int arch_bp_generic_fields(struct arch_hw_breakpoint_ctrl ctrl,
> -			   int *gen_len, int *gen_type, int *offset)
> +			   int *gen_len, int *gen_type)
>   {
>   	/* Type */
>   	switch (ctrl.type) {
> @@ -303,11 +303,6 @@ int arch_bp_generic_fields(struct arch_hw_breakpoint_ctrl ctrl,
>   		return -EINVAL;
>   	}
>   
> -	if (!ctrl.len)
> -		return -EINVAL;
> -
> -	*offset = __ffs(ctrl.len);
> -
>   	/* Len */
>   	switch (ctrl.len) {
>   	case LOONGARCH_BREAKPOINT_LEN_1:
> @@ -386,22 +381,17 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
>   			     struct arch_hw_breakpoint *hw)
>   {
>   	int ret;
> -	u64 alignment_mask, offset;
> +	u64 alignment_mask;
>   
>   	/* Build the arch_hw_breakpoint. */
>   	ret = arch_build_bp_info(bp, attr, hw);
>   	if (ret)
>   		return ret;
>   
> -	if (hw->ctrl.type != LOONGARCH_BREAKPOINT_EXECUTE)
> -		alignment_mask = 0x7;
> -	else
> +	if (hw->ctrl.type == LOONGARCH_BREAKPOINT_EXECUTE) {
>   		alignment_mask = 0x3;
> -	offset = hw->address & alignment_mask;
> -
> -	hw->address &= ~alignment_mask;
> -	hw->ctrl.len <<= offset;
> -
> +		hw->address &= ~alignment_mask;

hw->address &= ~0x3ul; ?

How about other types? The hw->address can fixed by hw->ctrl.len I think.

I suspect that LoongArch only support aligned load or store hw breakpoints.


Thanks,

Jinyang

> +	}
>   	return 0;
>   }
>   
> diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
> index c114c5ef1332..16b756c6049b 100644
> --- a/arch/loongarch/kernel/ptrace.c
> +++ b/arch/loongarch/kernel/ptrace.c
> @@ -494,28 +494,14 @@ static int ptrace_hbp_fill_attr_ctrl(unsigned int note_type,
>   				     struct arch_hw_breakpoint_ctrl ctrl,
>   				     struct perf_event_attr *attr)
>   {
> -	int err, len, type, offset;
> +	int err, len, type;
>   
> -	err = arch_bp_generic_fields(ctrl, &len, &type, &offset);
> +	err = arch_bp_generic_fields(ctrl, &len, &type);
>   	if (err)
>   		return err;
>   
> -	switch (note_type) {
> -	case NT_LOONGARCH_HW_BREAK:
> -		if ((type & HW_BREAKPOINT_X) != type)
> -			return -EINVAL;
> -		break;
> -	case NT_LOONGARCH_HW_WATCH:
> -		if ((type & HW_BREAKPOINT_RW) != type)
> -			return -EINVAL;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
>   	attr->bp_len	= len;
>   	attr->bp_type	= type;
> -	attr->bp_addr	+= offset;
>   
>   	return 0;
>   }
> @@ -609,7 +595,19 @@ static int ptrace_hbp_set_ctrl(unsigned int note_type,
>   		return PTR_ERR(bp);
>   
>   	attr = bp->attr;
> -	decode_ctrl_reg(uctrl, &ctrl);
> +
> +	switch (note_type) {
> +	case NT_LOONGARCH_HW_BREAK:
> +		ctrl.type = LOONGARCH_BREAKPOINT_EXECUTE;
> +		ctrl.len = LOONGARCH_BREAKPOINT_LEN_4;
> +		break;
> +	case NT_LOONGARCH_HW_WATCH:
> +		decode_ctrl_reg(uctrl, &ctrl);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
>   	err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
>   	if (err)
>   		return err;

