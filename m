Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51A11684A4
	for <loongarch@lists.linux.dev>; Sun,  3 Aug 2025 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754237860; cv=none; b=po0e4jbieaPFwYVMrwcsZLm2H0Pycbh2LQtWd/H6f9vDz+NoDeYdyDBx5In3+0rihDfM3jvMY1zPnTlyugpPKs+raaCEfgLjhOp9Y/1B1ZmcaAjiVcxDCFEAt7uOr2MDhnx7vaB80VLZ/R8uOd02RwTY3xZwgE7SKHNAQMBlayU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754237860; c=relaxed/simple;
	bh=qwMd0wuKDp4RoUBr5yM4nO5efDeYpHGf6z9Jmu0uYOM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=cWakWWNYn9NKNRuSY5c5IfLOEPqTC8QQ6MGe/tmcrs92WidM4ko834h9oAgXIsH7iCCFG/gmvBPcfTqfBinj5oDcFN0aAGy0ClM3hV5AKOb8pBQb8qQvtTf8qEge3OfdiCdTSGjxhqHmm/UDkmgezHzZyKkyNnAFzBK9Q8ZHGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T35daluZ; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T35daluZ"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4aedd1b006bso36211351cf.0
        for <loongarch@lists.linux.dev>; Sun, 03 Aug 2025 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754237857; x=1754842657; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ksW2204cxGe/Q7qCy5bNQAiisiPTEt8V6FoDVs1WPYw=;
        b=T35daluZNze82AwZRCG8YOqYAZwIhV6Ym5ctJ2BSjihwXiWkezkjbhSOf5dRZFhz37
         8w+xQHgjq8g0EC5Et6K6H3yqbSOgGK5VjlWpevFNE8stAW08jKseH/EiaHMV9XM+SMWp
         cwE8ik0ciapb3slZl5tQ24JnveDc5M/BSB8Zut4KvoqF59Wvcr2GkWe1/yJk05bu/6Kh
         rlA0neYwXxY6L3j6gNGFnk1Ghy2+2wgf2ST2LScp1b9qt/lL38xfNPZ/51HqV0PV2BbZ
         iFlLa29VBKvVQzhDycJzABd0FNXUVvUmKWSvLflPe5xO+NtGaRmQiHqiKeHlEdTc17jm
         UVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754237857; x=1754842657;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ksW2204cxGe/Q7qCy5bNQAiisiPTEt8V6FoDVs1WPYw=;
        b=OY0nLdVVzNW5a/vDWo1tHSIIeguRdjCZjJC1Xu6PnWfVqp37PZH/ASoQxx7LkIPqG2
         kPEd1zw8ULjDaolK68VTCJWRTkZswYoU19CxARQtMsw2GW/Sdd7/tadcrYdz/uehL6Wg
         vpkp0MkN4J+693/J8uN9ytjOSGfMsoKG9yDBDVysWKqEuQLP/nvgnInsZ90Yd5Y3bNS8
         DoJNTqkGMTuvqQT3eD4YhEdnk0KYJcHjKqH9G5GP2zQIPNrmF04NHXo272u1GWx3RmYC
         DT7yO/Hu9aYePbQKli/GIPiPL1EEz14BKJulDZG1jeBG+boQ7DM4s9ZFXCCdOoq7ZB4g
         G+Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVDzCupTwS/HYf2eUYja/4Y7m1Kkj8Ad3GYCVgiFhLwVv8qnnhDPeGQIKUJFIdQnPDmSxzqFVgBjp4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ7DIGQjoPSdP0gneK/IWbgIJpoekY62eoesx3lT0EVgdiQiYS
	D/ogQG6Z+d/mtcIQt2lj16aYVEVnMKO8nYt1bqhIHtEjlocajsex+CemESU6DBgZXg8+LnKc2CB
	eHvbLjJagjJJCCKuXEcM/KrTjt6bvU8KWi3dA
X-Gm-Gg: ASbGncsqJsx/yv1LjRGwRDPISV+nrL9tqlX9Am5atd9Q1ALhD1U9nO9gH7IB90V1Ho1
	KWFZI4wCBn8D/CyRB17iqoADQ7HsymdH1PIgZEsNA2zLTkI5OpbPiudsuX7HG0JIN8mJ9YOq4Bh
	vekU3VUUaODP2O6FopIblAn1BPJlFbkeHPYavdNX/Hmvs4/GU2ddobvgyjWI0JnOURC+q+jXeAX
	VH7TxI=
X-Google-Smtp-Source: AGHT+IH4xTOBkenU1Cz3emjLoDU3VIDc6zZXkMLek+O/adUxk7g1FK2+puVJFX2bjyh5tq+hDYQ5xd3mVuLwUnDBz/o=
X-Received: by 2002:a05:622a:191c:b0:4ae:6ac4:69dd with SMTP id
 d75a77b69052e-4af10d1e974mr98279421cf.45.1754237857430; Sun, 03 Aug 2025
 09:17:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sun, 3 Aug 2025 09:17:26 -0700
X-Gm-Features: Ac12FXyhOlL3Il4svbnL6JU9d1AeNsSEk7M-tLHi1xSpQsfqOfKhC4GkQKmosv4
Message-ID: <CAK3+h2xoeC0H2Zfw4-Mmp-0tONvz+ModOnCFF5+UaxvaNOprfw@mail.gmail.com>
Subject: loongarch bpf trampoline fentry_attach_stress test race condition issue
To: Huacai Chen <chenhuacai@kernel.org>, "cc: Tiezhu Yang" <yangtiezhu@loongson.cn>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, Hengqi Chen <hengqi.chen@gmail.com>, kernel@xen0n.name, 
	loongarch@lists.linux.dev, guodongtai@kylinos.cn, youling.tang@linux.dev, 
	jianghaoran@kylinos.cn, geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chenghao and Huacai,

the fentry_attach_stress test is from following commit:

commit d459dbbbfa323165849451edb9690a933c210bac
Author: Ilya Leoshkevich <iii@linux.ibm.com>
Date:   Wed Jul 16 21:35:07 2025 +0200

    selftests/bpf: Stress test attaching a BPF prog to another BPF prog

    Add a test that invokes a BPF prog in a loop, while concurrently
    attaching and detaching another BPF prog to and from it. This helps
    identifying race conditions in bpf_arch_text_poke().

    Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
    Link: https://lore.kernel.org/r/20250716194524.48109-3-iii@linux.ibm.com
    Signed-off-by: Alexei Starovoitov <ast@kernel.org>

https://lore.kernel.org/all/20250716194524.48109-2-iii@linux.ibm.com/
restore the race condition fix.

while reading s390 code bpf_arch_text_poke(), I noticed there is
text_poke_sync_lock() at the bottom line 2431, I am not sure this is
relevant or needed for loongarch

 565 static void bpf_jit_plt(struct bpf_plt *plt, void *ret, void *target)
 566 {
 567         memcpy(plt, &bpf_plt, sizeof(*plt));
 568         plt->ret = ret;
 569         /*
 570          * (target == NULL) implies that the branch to this PLT entry was
 571          * patched and became a no-op. However, some CPU could have jumped
 572          * to this PLT entry before patching and may be still executing it.
 573          *
 574          * Since the intention in this case is to make the PLT
entry a no-op,
 575          * make the target point to the return label instead of NULL.
 576          */
 577         plt->target = target ?: ret;
 578 }
 579


2385 int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type t,
2386                        void *old_addr, void *new_addr)
2387 {
2388         struct bpf_plt expected_plt, current_plt, new_plt, *plt;
2389         struct {
2390                 u16 opc;
2391                 s32 disp;
2392         } __packed insn;
2393         char *ret;
2394         int err;
2395
2396         /* Verify the branch to be patched. */
2397         err = copy_from_kernel_nofault(&insn, ip, sizeof(insn));
2398         if (err < 0)
2399                 return err;
2400         if (insn.opc != (0xc004 | (old_addr ? 0xf0 : 0)))
2401                 return -EINVAL;
2402
2403         if (t == BPF_MOD_JUMP &&
2404             insn.disp == ((char *)new_addr - (char *)ip) >> 1) {
2405                 /*
2406                  * The branch already points to the destination,
2407                  * there is no PLT.
2408                  */
2409         } else {
2410                 /* Verify the PLT. */
2411                 plt = ip + (insn.disp << 1);
2412                 err = copy_from_kernel_nofault(&current_plt, plt,
2413                                                sizeof(current_plt));
2414                 if (err < 0)
2415                         return err;
2416                 ret = (char *)ip + 6;
2417                 bpf_jit_plt(&expected_plt, ret, old_addr);
2418                 if (memcmp(&current_plt, &expected_plt,
sizeof(current_plt)))
2419                         return -EINVAL;
2420                 /* Adjust the call address. */
2421                 bpf_jit_plt(&new_plt, ret, new_addr);
2422                 s390_kernel_write(&plt->target, &new_plt.target,
2423                                   sizeof(void *));
2424         }
2425
2426         /* Adjust the mask of the branch. */
2427         insn.opc = 0xc004 | (new_addr ? 0xf0 : 0);
2428         s390_kernel_write((char *)ip + 1, (char *)&insn.opc + 1, 1);
2429
2430         /* Make the new code visible to the other CPUs. */
2431         text_poke_sync_lock();
2432
2433         return 0;
2434 }

void text_poke_sync_lock(void)
{
        cpus_read_lock();
        text_poke_sync();
        cpus_read_unlock();
}

I hope it helps :)
