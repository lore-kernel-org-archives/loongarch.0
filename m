Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7C92FE56E
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764060888; cv=none; b=C1XD4yb3kYt2FMQGolLNfUmRZRYL/99puUDI+u+kyBVnyYl9GUeoVDDKuEbzFYnrRba3uCugv63IWr/6/XzJ4ZiW5iRj7qw5/AdgtqaRZOt/KD+EqMmjOmRcv147snUxQRgr1JFpEnjaCSkTJYuSpV+bTvHxNx4t3jrDuIcL6h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764060888; c=relaxed/simple;
	bh=v2yCKw7Fp+ZrMwp0nt56fMjs7QYnpONGzG4mzacXkHI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=tWUcA+iOdoYC56jYIEHhveUNRUjiqO4HDHteFw707q8+UR9hJ6tFJZVChHwbeSFdXLCdSeWIE/cgU8IQ5Gcpg7IyIqyP8SZv0s//2Hp6mFH2SOByVZD8tCXq4sqTSTcTkIWefg+/CbxXQAINMof7y12YcygQr1eBIhqy9QwYM7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxxtDPbiVp+tQnAA--.18616S3;
	Tue, 25 Nov 2025 16:54:40 +0800 (CST)
Received: from [10.130.40.41] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxecDMbiVpppI+AQ--.15533S3;
	Tue, 25 Nov 2025 16:54:37 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Zhang <zhangxi@kylinos.cn>, Xianglai Li <lixianglai@loongson.cn>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251125063327.31586-1-yangtiezhu@loongson.cn>
 <CAAhV-H5AO38DAqxUyawwKW_f=ZuCaROj+s--vE8ham0sTWMxog@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <332975a8-c7f1-76d5-0628-cd7260ad1180@loongson.cn>
Date: Tue, 25 Nov 2025 16:54:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5AO38DAqxUyawwKW_f=ZuCaROj+s--vE8ham0sTWMxog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxecDMbiVpppI+AQ--.15533S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr4ftw1DGry8Kr1DJFyDtwc_yoW5ArWDpF
	9rAFs5KFW8JFy09a4qvwn8WryUZ3yDWwnxW3Z3tr95C3Z8Z3ZxXw18Zw1Dua1qvrW0g3WI
	qrn5K34Y9a1UAFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2L05UUUUU

On 2025/11/25 下午4:08, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> On Tue, Nov 25, 2025 at 2:34 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> When running virtual machine before testing the kernel live patching with
>> "modprobe livepatch-sample", there is a timeout over 15 seconds, the dmesg
>> command shows "unreliable stack" for user tasks in debug mode.
>>
>> The "unreliable stack" is because it can not unwind from kvm_handle_exit()
>> to its previous frame kvm_exc_entry() due to the PC is not a valid kernel
>> address, the root cause is that the code of kvm_exc_entry() was copied to
>> the DMW area in kvm_loongarch_env_init(), so it should check the PC range
>> and then finish unwinding for this special case.
>>
>> How to test:
>>
>> (1) Update kernel with LIVEPATCH
>>
>>    git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>    cd linux && make mrproper defconfig
>>    scripts/config -e FTRACE -e FUNCTION_TRACER \
>>    -e LIVEPATCH -e SAMPLES -m SAMPLE_LIVEPATCH
>>    make olddefconfig all -j"$(nproc)"
>>    sudo make modules_install
>>    sudo make install
>>    sudo reboot
>>
>> (2) Set up a VM with "-accel kvm", no need to specify kernel and initrd
>>
>>    sudo yum -y install edk2-loongarch64 qemu
>>    qemu-system-loongarch64 -serial stdio \
>>    -machine virt -cpu la464 -smp 8 -m 4G \
>>    -bios /usr/share/edk2/loongarch64/QEMU_EFI.fd \
>>    -nodefaults -no-reboot -nographic -accel kvm
>>
>> (3) Test the kernel live patching
>>
>>    cat /proc/cmdline
>>    sudo modprobe livepatch-sample
>>    cat /proc/cmdline
>>    sudo sh -c "echo 0 > /sys/kernel/livepatch/livepatch_sample/enabled"
>>    sudo rmmod livepatch_sample
>>    cat /proc/cmdline
>>    dmesg -T
>>
>> Cc: stable@vger.kernel.org # v6.9+
>> Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
>> Reported-by: Xi Zhang <zhangxi@kylinos.cn>
>> Reported-by: Xianglai Li <lixianglai@loongson.cn>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   arch/loongarch/kernel/unwind_orc.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
>> index 0d5fa64a2225..1d60a593479a 100644
>> --- a/arch/loongarch/kernel/unwind_orc.c
>> +++ b/arch/loongarch/kernel/unwind_orc.c
>> @@ -506,6 +506,9 @@ bool unwind_next_frame(struct unwind_state *state)
>>                  goto err;
>>          }
>>
>> +       if (pc >= (unsigned long)_end && pc < (unsigned long)XKVRANGE)
>> +               goto end;
> The __kernel_text_address() judgement after bt_address() do the same
> thing exactly, so why do we need this?

They are different code paths, the current path is "goto err", it will
set state->error as true, then arch_stack_walk_reliable() will return
-EINVAL.

With this patch, the code path is "goto end" for this case, it will
not set state->error as true, then arch_stack_walk_reliable() will
return 0.

Thanks,
Tiezhu

