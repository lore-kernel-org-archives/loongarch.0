Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799271A708;
	Wed, 18 Oct 2023 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bxd+g3xS9l2uAyAA--.62482S3;
	Wed, 18 Oct 2023 19:44:55 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxE+Q2xS9lai0pAA--.23449S3;
	Wed, 18 Oct 2023 19:44:55 +0800 (CST)
Subject: Re: [PATCH v2 8/8] LoongArch: Add ORC unwinder support
To: kernel test robot <lkp@intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
References: <1696856590-30298-9-git-send-email-yangtiezhu@loongson.cn>
 <202310102113.bw7w3ZVv-lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <b30b034d-46ee-618b-5f92-b0f7dde1219a@loongson.cn>
Date: Wed, 18 Oct 2023 19:44:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202310102113.bw7w3ZVv-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8BxE+Q2xS9lai0pAA--.23449S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF45Aw1DGFy3Wr13tw4rtFc_yoW8XFW7pa
	9Y93yIyryrWF18ua4DWr4UXw4jyr40ya4F9FyagryUA3ZIqFy3AFs2yrWY9ryUG3s7trZ5
	KFWS9as8XF1UC3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkU
	UUUU=



On 10/10/2023 09:46 PM, kernel test robot wrote:
> Hi Tiezhu,
>
> kernel test robot noticed the following build errors:

...

>    In file included from scripts/sorttable.c:201:
>>> scripts/sorttable.h:96:10: fatal error: 'asm/orc_types.h' file not found
>    #include <asm/orc_types.h>
>             ^~~~~~~~~~~~~~~~~
>    1 error generated.

Thanks for your report, I can reproduce the error on x86:

   make ARCH=x86_64 olddefconfig
   make ARCH=x86_64 prepare

The build error is related with "ARCH=x86_64", there is no error
without "ARCH=x86_64" when build locally on x86.

As described in Documentation/kbuild/makefiles.rst:

   For example, you can pass in ARCH=i386, ARCH=x86_64, or ARCH=x86.
   For all of them, SRCARCH=x86 because arch/x86/ supports both i386 and
   x86_64.

we should use SRCARCH instead of ARCH to specify the directory,
like this:

diff --git a/scripts/Makefile b/scripts/Makefile
index 576cf64..e4cca53 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -31,9 +31,12 @@ HOSTLDLIBS_sign-file = $(shell $(HOSTPKG_CONFIG) 
--libs libcrypto 2> /dev/null |

  ifdef CONFIG_UNWINDER_ORC
  ifeq ($(ARCH),x86_64)
-ARCH := x86
+SRCARCH := x86
  endif
-HOSTCFLAGS_sorttable.o += -I$(srctree)/tools/arch/x86/include
+ifeq ($(ARCH),loongarch)
+SRCARCH := loongarch
+endif
+HOSTCFLAGS_sorttable.o += -I$(srctree)/tools/arch/$(SRCARCH)/include
  HOSTCFLAGS_sorttable.o += -DUNWINDER_ORC_ENABLED
  endif

I will update the related code of this patch in the next version.

Thanks,
Tiezhu

