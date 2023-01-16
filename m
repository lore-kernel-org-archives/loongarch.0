Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AA910EA;
	Mon, 16 Jan 2023 03:19:32 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bxa+o8wsRj48sBAA--.5550S3;
	Mon, 16 Jan 2023 11:19:25 +0800 (CST)
Received: from [10.130.0.135] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axvr45wsRjYgUaAA--.53479S3;
	Mon, 16 Jan 2023 11:19:22 +0800 (CST)
Subject: Re: [PATCH v11 3/6] LoongArch: Add kretprobe support
To: kernel test robot <lkp@intel.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Masami Hiramatsu <mhiramat@kernel.org>
References: <1673688444-24251-4-git-send-email-yangtiezhu@loongson.cn>
 <202301151852.m2cigv2D-lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <bfac74ca-5e8e-7a02-71d4-9b69b804aa7c@loongson.cn>
Date: Mon, 16 Jan 2023 11:19:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202301151852.m2cigv2D-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Axvr45wsRjYgUaAA--.53479S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJw4fXr15WrW8Zr4xZF48tFb_yoW5ArWxpa
	yDZr1akr4rWr95XFZ7GayUX3W8Krn5A3srZryUK34Y9ay5Zryftrn293y5AFZrKwn8KFyF
	vr4Fqas5KF43Aa7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bqxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82ZX5UUUUU==



On 01/15/2023 07:17 PM, kernel test robot wrote:
> Hi Tiezhu,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.2-rc3 next-20230113]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Tiezhu-Yang/LoongArch-Simulate-branch-and-PC-instructions/20230114-173012
> patch link:    https://lore.kernel.org/r/1673688444-24251-4-git-send-email-yangtiezhu%40loongson.cn
> patch subject: [PATCH v11 3/6] LoongArch: Add kretprobe support
> config: loongarch-allmodconfig
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/da766ea35a574bece74a5068aad708b5773b2981
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Tiezhu-Yang/LoongArch-Simulate-branch-and-PC-instructions/20230114-173012
>         git checkout da766ea35a574bece74a5068aad708b5773b2981
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash arch/loongarch/kernel/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> Note: functions only called from assembly code should be annotated with the asmlinkage attribute
> All warnings (new ones prefixed by >>):
>
>>> arch/loongarch/kernel/kprobes.c:376:14: warning: no previous prototype for 'trampoline_probe_handler' [-Wmissing-prototypes]
>      376 | void __used *trampoline_probe_handler(struct pt_regs *regs)
>          |              ^~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +/trampoline_probe_handler +376 arch/loongarch/kernel/kprobes.c
>
>    374	
>    375	/* Called from __kretprobe_trampoline */
>  > 376	void __used *trampoline_probe_handler(struct pt_regs *regs)
>    377	{
>    378		return (void *)kretprobe_trampoline_handler(regs, NULL);
>    379	}
>    380	NOKPROBE_SYMBOL(trampoline_probe_handler);
>    381	
>

Thanks for the report, I can reproduce it when make W=1
and also can silence it when declare the prototype

void *trampoline_probe_handler(struct pt_regs *regs);

in arch/loongarch/include/asm/kprobes.h

Let me wait for some time, if no more comments, I will
update this patch and then send v12.

Thanks,
Tiezhu

