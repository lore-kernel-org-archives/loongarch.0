Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E01513A415;
	Tue,  4 Jun 2024 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717494591; cv=none; b=ucmywxifaEqndfGUwcBW9e9PZxYrXAOZPGRDkYY1skH28d6q0xqlJXs9HHTb+qnvNfT7kegZ29DG15I0JCB+tynxaeFURSJRXAI8idgKZ2hbh2np+JuZ4r+M5dbVpc9bOXrG+zJlyZDJ2XGgXO93EJan/tPYhTiTEnyJw+A68aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717494591; c=relaxed/simple;
	bh=kQvOxl+W+YHmQ7mHuBf1Q5LgmW/IF900QP1wyeLEktI=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ABXS3GCXXXiI8SFDJaocFcRDl/86v3xFb/peRLUh6cJzKKvqF7Yh8qYBS3wObhTXHCOKIWSvEIUHdCMSI4EZx3bQqKbWgCEovVHUQ3A8JqjEnm4LMABHS6RDSWsQD4csXLw6FSkKljmk03FgpleOcy6k9wFH8TX4DuRydiIJ9KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxyOkz415mh1gDAA--.1357S3;
	Tue, 04 Jun 2024 17:49:39 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxosQv415m8w8UAA--.39639S3;
	Tue, 04 Jun 2024 17:49:36 +0800 (CST)
Subject: Re: [rt-devel:linux-6.10.y-rt-rebase 63/93] kernel/printk/printk.o:
 warning: objtool: __jump_table+0x0: special: can't find orig instruction
To: Yujie Liu <yujie.liu@intel.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, John Ogness <john.ogness@linutronix.de>
References: <202405300545.mVqyyvyr-lkp@intel.com>
 <87ttiamkf4.fsf@jogness.linutronix.de> <Zl5m1ZlVmGKitAof@yujie-X299>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, loongarch@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <8690e36c-5fce-5f87-be9b-edc30248167f@loongson.cn>
Date: Tue, 4 Jun 2024 17:49:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Zl5m1ZlVmGKitAof@yujie-X299>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8CxosQv415m8w8UAA--.39639S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGFyxCw17Ww43uw1xZF1fGrX_yoW5ZFW5pa
	yrGFWDtrs5XFn7K3yxtFyDWF4FqwsxCryUWF1UAr18Z3yjvr1jvws7tr9IvF9rK39rtryI
	q34SgFnxta1rA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
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

On 06/04/2024 08:59 AM, Yujie Liu wrote:
> + Loongarch folks
>
> Hi Huacai and Xuerui,
>
> Could you please help take a look at this case? Thanks.
>
> On Mon, Jun 03, 2024 at 11:48:55AM +0206, John Ogness wrote:
>> On 2024-05-30, kernel test robot <lkp@intel.com> wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.10.y-rt-rebase
>>> head:   6d20efa57a896036453f4b061ae22601ef61b494
>>> commit: 127f3e5b794bd6fa90d4649318dd898455efa6d7 [63/93] printk: Provide threadprintk boot argument
>>> config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240530/202405300545.mVqyyvyr-lkp@intel.com/config)
>>> compiler: loongarch64-linux-gcc (GCC) 13.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300545.mVqyyvyr-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202405300545.mVqyyvyr-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> kernel/printk/printk.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction
>>> --
>>>>> kernel/printk/nbcon.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction
>>
>> On loongarch, it looks like all users of the jump_table are causing this
>> warning. I will assume this is something that needs to be fixed at the
>> arch level (either in the kernel or the compiler).
>>
>> John Ogness
>>

Here are my thoughts, anyway it is up to the maintainers.

After commit 9cc1df421f00 ("LoongArch: Update Loongson-3 default
config file"), there exist some build regressions about objtool
warnings on LoongArch. This is because objtool does not work well
with jump tables, -fno-jump-tables is already added in Makefile,
but there are some special cases, some warnings can be reproduced
because the code has __annotate_jump_table, some warnings can not
be reproduced with unknown reason (maybe due to the lower version
of compiler toolchain). In order to avoid the warnings reported
by kernel test robot, it is better to remove CONFIG_UNWINDER_ORC=y
in defconfig for now, the proper time to enable ORC stack unwinder 
should after objtool supports jump tables on LoongArch.

arch/loongarch/Makefile

   ifdef CONFIG_OBJTOOL
   KBUILD_CFLAGS           += -fno-jump-tables
   endif

include/linux/compiler.h

   /* Annotate a C jump table to allow objtool to follow the code flow */
   #define __annotate_jump_table __section(".rodata..c_jump_table")

Like this:

diff --git a/arch/loongarch/configs/loongson3_defconfig 
b/arch/loongarch/configs/loongson3_defconfig
index b4252c357c8e..0eb14e9259c2 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -983,4 +983,3 @@ CONFIG_DEBUG_FS=y
  CONFIG_SCHEDSTATS=y
  # CONFIG_DEBUG_PREEMPT is not set
  # CONFIG_FTRACE is not set
-CONFIG_UNWINDER_ORC=y

Thanks,
Tiezhu

