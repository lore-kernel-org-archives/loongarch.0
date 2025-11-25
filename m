Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43A0261B6D
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 10:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067956; cv=none; b=nUT4jhgCHZWrAmSvFJi5ateYyv+PWpV/kM/+FNoFKvsWliPq59agPOlVGV10941sA5gY6cVK4yjWPvxmqhhkINVdSA166WXK8ypQ53/gt0EHqt50VsYGYyCI1OIPuRnfefrpbvLpr/LgewNWS7QcH6wVr10J4vw0au8NfE4lFg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067956; c=relaxed/simple;
	bh=QdTSPvj9bSNNWL1/TbyuyMWPHT5htfamyTb50ul4ZJg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=i3nCsGLw66CQUOXB4HGDVlG0pgoDgU5flrhcGTRnLN1NxjJsjDLcOOeddbXe+NydLQ5lpbjeutp009gqtcRPLIMcfyxkPzjP9xbrp2D/rYDaRpqPdV+pdELUCNU7lNGLxa5RQ/ERgtTdz7Y6Qclb3/EyLrKyIdQQQNl5Lk4ynnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Bx379siiVpKuAnAA--.18190S3;
	Tue, 25 Nov 2025 18:52:28 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by front1 (Coremail) with SMTP id qMiowJBxTMFoiiVpXLI+AQ--.47133S3;
	Tue, 25 Nov 2025 18:52:26 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xi Zhang <zhangxi@kylinos.cn>,
 Xianglai Li <lixianglai@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251125063327.31586-1-yangtiezhu@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <658bb477-b3f1-97c1-ab37-5dafcb6215f5@loongson.cn>
Date: Tue, 25 Nov 2025 18:52:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251125063327.31586-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJBxTMFoiiVpXLI+AQ--.47133S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCw43GFWUZFWrtrWftrWftFc_yoW5Cr17pF
	WDAr1rtrW8JF9Yqa4DCw17urykZw4DW34aqan7tr95AFn0qFnxXw4vvwnrua1qqrW0ga1I
	vFZ3CFyjka1UAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-
	e5UUUUU==

On 2025-11-25 14:33, Tiezhu Yang wrote:

> When running virtual machine before testing the kernel live patching with
> "modprobe livepatch-sample", there is a timeout over 15 seconds, the dmesg
> command shows "unreliable stack" for user tasks in debug mode.
>
> The "unreliable stack" is because it can not unwind from kvm_handle_exit()
> to its previous frame kvm_exc_entry() due to the PC is not a valid kernel
> address, the root cause is that the code of kvm_exc_entry() was copied to
> the DMW area in kvm_loongarch_env_init(), so it should check the PC range
> and then finish unwinding for this special case.

Hi, Tiezhu,

Since kvm_loongarch_env_init copies kvm_exc_entry which similar to how
trap_init copies the exception handler. We should apply the same
offset-based adjustment to compute the shadow PC address:
  shadow_pc = kvm_exc_entry + (cur_pc − copied_base_address)
This allows the ORC unwinder to correctly locate the corresponding 
unwind info.

On the other hand, the address range [_end, XKVRANGE) is unreliable.
If an immediate value is in this range and pushed into the stack,
unwinder might mistakenly interpret once it get this value as pc.

Jinyang


>
> How to test:
>
> (1) Update kernel with LIVEPATCH
>
>    git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>    cd linux && make mrproper defconfig
>    scripts/config -e FTRACE -e FUNCTION_TRACER \
>    -e LIVEPATCH -e SAMPLES -m SAMPLE_LIVEPATCH
>    make olddefconfig all -j"$(nproc)"
>    sudo make modules_install
>    sudo make install
>    sudo reboot
>
> (2) Set up a VM with "-accel kvm", no need to specify kernel and initrd
>
>    sudo yum -y install edk2-loongarch64 qemu
>    qemu-system-loongarch64 -serial stdio \
>    -machine virt -cpu la464 -smp 8 -m 4G \
>    -bios /usr/share/edk2/loongarch64/QEMU_EFI.fd \
>    -nodefaults -no-reboot -nographic -accel kvm
>
> (3) Test the kernel live patching
>
>    cat /proc/cmdline
>    sudo modprobe livepatch-sample
>    cat /proc/cmdline
>    sudo sh -c "echo 0 > /sys/kernel/livepatch/livepatch_sample/enabled"
>    sudo rmmod livepatch_sample
>    cat /proc/cmdline
>    dmesg -T
>
> Cc: stable@vger.kernel.org # v6.9+
> Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
> Reported-by: Xi Zhang <zhangxi@kylinos.cn>
> Reported-by: Xianglai Li <lixianglai@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/loongarch/kernel/unwind_orc.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
> index 0d5fa64a2225..1d60a593479a 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -506,6 +506,9 @@ bool unwind_next_frame(struct unwind_state *state)
>   		goto err;
>   	}
>   
> +	if (pc >= (unsigned long)_end && pc < (unsigned long)XKVRANGE)
> +		goto end;
> +
>   	state->pc = bt_address(pc);
>   	if (!state->pc) {
>   		pr_err("cannot find unwind pc at %p\n", (void *)pc);

