Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBE125FA2D
	for <loongarch@lists.linux.dev>; Thu,  9 Oct 2025 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759994878; cv=none; b=GhlGAZ+xIxOGW34tgQrKZi26nprDvea0CebATEftnOkuH6Rp7xfwoT+D63vCXesxXv102jw8n1wPvehR7dJRQovJZbBnZOLcPfSnTN2q/knlrf2OuqyrYLht8uVl+IBC07QabmW+X1+XPlkNrcvEpuA5BXsEQtDuoh+inT7CAD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759994878; c=relaxed/simple;
	bh=XfqDBfd6iAezjZ4Zyx6Aa3kJN4a1sI8LfvLWt/i2PWw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qJOEW+xs/nZ3APkv0Ha+C8X4HM8/cOs/Mwi0oiPHrMIREtjXJIm92FQeXn9/DRF2jozREAGLXVING8lCBPOkPSel8fo9ff1rMaAKjEz7TZAYK4mFHIkm8eo4qA8kMfIgu5gMvVieiFEzzhEbwjEPFwv+lo1+HZoJ/CznvurRKs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxrr_zY+doGjAUAA--.41959S3;
	Thu, 09 Oct 2025 15:27:47 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxocLrY+doN1fWAA--.11175S3;
	Thu, 09 Oct 2025 15:27:39 +0800 (CST)
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250928085506.4471-1-yangtiezhu@loongson.cn>
 <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn>
Date: Thu, 9 Oct 2025 15:27:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxocLrY+doN1fWAA--.11175S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxuFyDZr45uF48uFyxuF4DAwc_yoWxWw1kpa
	yjkFWjyr4kJr4kXas7t3yY9r1YqanIqrWaga4DuryrZa1qqr40vrWUZr4DuF9rXw4DC3WI
	qF1fJr9Ik3WUJ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU24SoDUUU
	U

On 2025/9/28 下午10:41, Ard Biesheuvel wrote:
> On Sun, 28 Sept 2025 at 16:39, Ard Biesheuvel <ardb@kernel.org> wrote:
>>
>> On Sun, 28 Sept 2025 at 15:52, Huacai Chen <chenhuacai@kernel.org> wrote:
>>>
>>> Hi, Ard,
>>>
>>> On Sun, Sep 28, 2025 at 9:42 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>>>>
>>>> On Sun, 28 Sept 2025 at 10:55, Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>>>>
>>>>> When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
>>>>> the following objtool warning on LoongArch:
>>>>>
>>>>>    vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
>>>>>    falls through to next function __efistub_exit_boot_func()
>>>>>
>>>>> This is because efi_boot_kernel() doesn't end with a return instruction
>>>>> or an unconditional jump, then objtool has determined that the function
>>>>> can fall through into the next function.
>>>>>
>>>>> At the beginning, try to do something to make efi_boot_kernel() ends with
>>>>> an unconditional jump instruction, but this modification seems not proper.
>>>>>
>>>>> Since the efistub functions are useless for stack unwinder, they can be
>>>>> ignored by objtool. After many discussions, no need to link libstub to
>>>>> the vmlinux.o, only link libstub to the final vmlinux.
>>>>>
>>>>
>>>> Please try keeping these changes confined to arch/loongarch. This
>>>> problem does not exist on other architectures, and changing the way
>>>> vmlinux is constructed might create other issues down the road.

This was discussed and tested in the v3 patch, it only touches the code
of LoongArch and works well like this:

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index dc5bd3f1b8d2..f34b416f5ca2 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -169,7 +169,6 @@ CHECKFLAGS += $(shell $(CC) $(KBUILD_CPPFLAGS) 
$(KBUILD_CFLAGS) -dM -E -x c /dev
  endif

  libs-y += arch/loongarch/lib/
-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a

  drivers-y              += arch/loongarch/crypto/

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 433849ff7529..ed94871c3606 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -69,6 +69,12 @@ vmlinux_link()
                 libs="${KBUILD_VMLINUX_LIBS}"
         fi

+       if [ "${SRCARCH}" = "loongarch" ]; then
+               if is_enabled CONFIG_EFI_STUB; then
+                       libs="${libs} drivers/firmware/efi/libstub/lib.a"
+               fi
+       fi
+
         if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
                 objs="${objs} .builtin-dtbs.o"
         fi

https://lore.kernel.org/loongarch/pq4h7jgndnt6p45lj4kgubxjd5gidfetugcuf5rcxzxxanzetd@6rrlpjnjsmuy/

>>> ARM, RISC-V and LoongArch do things exactly in the same way. Now
>>> LoongArch is the first of the three to enable objtool, so we meet the
>>> problem first.
>>>
>>> But yes, I also don't want to change the way of constructing vmlinux.
>>> So I prefer the earliest way to fix this problem.
>>> https://lore.kernel.org/loongarch/CAAhV-H7fRHGFVKV8HitRgmuoDPt5ODt--iSuV0EmeeUb9d5FNw@mail.gmail.com/T/#meef7411abd14f4c28c85e686614aa9211fccdca0
>>>
>>
>> Can we just drop the __noreturn annotation from kernel_entry_t, and
>> return EFI_SUCCESS from efi_boot_kernel()?

This was done in the early RFC patch, it works well like this:

diff --git a/drivers/firmware/efi/libstub/loongarch.c 
b/drivers/firmware/efi/libstub/loongarch.c
index 3782d0a187d1..e309fd78fca7 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -10,7 +10,7 @@
  #include "efistub.h"
  #include "loongarch-stub.h"

-typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned long cmdline,
+typedef void (*kernel_entry_t)(bool efi, unsigned long cmdline,
  					  unsigned long systab);

  efi_status_t check_platform_features(void)
@@ -81,4 +81,7 @@ efi_status_t efi_boot_kernel(void *handle, 
efi_loaded_image_t *image,

  	real_kernel_entry(true, (unsigned long)cmdline_ptr,
  			  (unsigned long)efi_system_table);
+
+	/* We should never get here */
+	while (1);
  }

https://lore.kernel.org/loongarch/20250826064631.9617-2-yangtiezhu@loongson.cn/

> ... or add efi_boot_kernel() to ./tools/objtool/noreturns.h?

It can not fix the objtool warning.

Are you OK with the following changes?

(1) libstub doesn't link to vmlinux.o, only link libstub with vmlinux.o 
during the final vmlinux link, keep the changes confined to LoongArch, 
no need to be something more generic.

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index dc5bd3f1b8d2..f34b416f5ca2 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -169,7 +169,6 @@ CHECKFLAGS += $(shell $(CC) $(KBUILD_CPPFLAGS) 
$(KBUILD_CFLAGS) -dM -E -x c /dev
  endif

  libs-y += arch/loongarch/lib/
-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a

  drivers-y              += arch/loongarch/crypto/

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 433849ff7529..ed94871c3606 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -69,6 +69,12 @@ vmlinux_link()
                 libs="${KBUILD_VMLINUX_LIBS}"
         fi

+       if [ "${SRCARCH}" = "loongarch" ]; then
+               if is_enabled CONFIG_EFI_STUB; then
+                       libs="${libs} drivers/firmware/efi/libstub/lib.a"
+               fi
+       fi
+
         if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
                 objs="${objs} .builtin-dtbs.o"
         fi

(2) remove the attribute __noreturn for real_kernel_entry() and add
"while (1);" at the end of efi_boot_kernel().

diff --git a/drivers/firmware/efi/libstub/loongarch.c 
b/drivers/firmware/efi/libstub/loongarch.c
index 3782d0a187d1..e309fd78fca7 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -10,7 +10,7 @@
  #include "efistub.h"
  #include "loongarch-stub.h"

-typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned long cmdline,
+typedef void (*kernel_entry_t)(bool efi, unsigned long cmdline,
  					  unsigned long systab);

  efi_status_t check_platform_features(void)
@@ -81,4 +81,7 @@ efi_status_t efi_boot_kernel(void *handle, 
efi_loaded_image_t *image,

  	real_kernel_entry(true, (unsigned long)cmdline_ptr,
  			  (unsigned long)efi_system_table);
+
+	/* We should never get here */
+	while (1);
  }

Taking all of the considerations in balance, what should to do?

Thanks,
Tiezhu

