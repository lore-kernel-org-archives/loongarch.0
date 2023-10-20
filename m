Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902A116433
	for <loongarch@lists.linux.dev>; Fri, 20 Oct 2023 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxpPA1VjJlFHMzAA--.34556S3;
	Fri, 20 Oct 2023 18:28:05 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxH90zVjJlvzssAA--.30051S3;
	Fri, 20 Oct 2023 18:28:04 +0800 (CST)
Subject: Re: [PATCH v3 0/8] Add objtool and orc support for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
References: <1697768821-22931-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H4wqO0=+EOhyH+t=0bpiX2DayddVArB=x_yzVvmX9OW1g@mail.gmail.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <a967ebeb-f19d-4e36-3547-80e838ad2fa0@loongson.cn>
Date: Fri, 20 Oct 2023 18:28:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4wqO0=+EOhyH+t=0bpiX2DayddVArB=x_yzVvmX9OW1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8AxH90zVjJlvzssAA--.30051S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AF48Zry3tFW5JrWDGFWDWrX_yoW8Aw1DpF
	sFvrW2grWDW3sYy34kG3W0g34vvF1IkryYqFykGFWUArZ5Ary0qa97JFykZF17X3Z0va1Y
	934Igr15WF17AagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r
	1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U14lk7UUUUU==



On 10/20/2023 04:51 PM, Huacai Chen wrote:
> Cross compiling on X86 for LoongArch fails:
>
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
> make[5]: *** No rule to make target
> '/usr/lib/gcc/x86_64-redhat-linux/8/include/stdbool.h', needed by
> '/home/chenhuacai/linux-official.git/tools/objtool/libsubcmd/exec-cmd.o'.
> Stop.
> make[4]: *** [Makefile:80:
> /home/chenhuacai/linux-official.git/tools/objtool/libsubcmd/libsubcmd-in.o]
> Error 2
> make[3]: *** [Makefile:82:
> /home/chenhuacai/linux-official.git/tools/objtool/libsubcmd/libsubcmd.a]
> Error 2
> make[2]: *** [Makefile:73: objtool] Error 2
> make[1]: *** [/home/chenhuacai/linux-official.git/Makefile:1355:
> tools/objtool] Error 2
> make: *** [Makefile:234: __sub-make] Error 2

It seems that there is no stdbool.h in your cross compile environment.

It works well with the following steps, you can try it.

wget 
https://github.com/loongson/build-tools/releases/download/2023.08.08/x86_64-cross-tools-loongarch64-gcc-libc.tar.xz
tar xf x86_64-cross-tools-loongarch64-gcc-libc.tar.xz -C /opt
export PATH=/opt/cross-tools/bin/:$PATH
export 
LD_LIBRARY_PATH=/opt/cross-tools/loongarch64-unknown-linux-gnu/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/cross-tools/lib:$LD_LIBRARY_PATH
export CROSS_COMPILE=loongarch64-unknown-linux-gnu-
export ARCH=loongarch

find /opt -name stdbool.h
/opt/cross-tools/lib/gcc/loongarch64-unknown-linux-gnu/14.0.0/include/stdbool.h
/opt/cross-tools/loongarch64-unknown-linux-gnu/include/c++/14.0.0/tr1/stdbool.h

cd linux.git
make loongson3_defconfig
make menuconfig   # select CONFIG_UNWINDER_ORC
make -j4

Thanks,
Tiezhu

