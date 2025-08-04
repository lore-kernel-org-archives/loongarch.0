Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D713B218E8B
	for <loongarch@lists.linux.dev>; Mon,  4 Aug 2025 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754320113; cv=none; b=s8U58nHnDSyb2ZyUW0QwnKQAgD3/rNPm7pRE4wZHiF1tWmxsDUURiVNlSNv89HjKwt0xromsxFgrR1UqtnuyQz4t/EAx8XkaiJfPYEh0JRpgN94K+I5Abq20J877kNu8/1D5bbM7qVymxLphfKSqV51qmn8i/NILAOUlL1Dfb+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754320113; c=relaxed/simple;
	bh=5HSOtkLJjDdniab9ztpEDa+Lx58Kq3urrxkr5lEFB88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nYcqtK5QaTX7OD/VXfSi8K92u3qfMFw3lIRWD31or9jHgY8qLYAeN8gvxAL+877Bz39Ekr5FBS71md06mj+tIs+cfgpZBhRaoKkx+TSqabIlqQKkqpXQODJLRMjctHTcZisIJnNTLf7PcEie/56Nf9vZ0p4pbNjkrnFw3Jz4cUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUk6uun4; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUk6uun4"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e6974a290eso212358085a.3
        for <loongarch@lists.linux.dev>; Mon, 04 Aug 2025 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754320110; x=1754924910; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aQeYw4Fy84I8q6tvo5X2FdN9fKUrtRsLUFW/OPteVQ=;
        b=hUk6uun4+8Fib8Pwx3gvaYgEb1g61r3L00gYXdnlkGAwIdpdkYtzcWDqQMTZBdxXQv
         FWSt9T5ipn4zqLTuYJdTCGqRQ+PM4hnc8TvGSSEJn2UFbyudRftOEEoXnJQdfXrdq8hk
         0TzhA6AAMlmnRslueZNWeNexhp1BjFWu72KmgLD5U1y7ojaEdN9IiCsUBbv+uidE9xbX
         dVbczdU0Hb1PolMJ8fB/NorAmhM5InShOevyIRa3rLp/qI01SI7eEFKo3wp/5AJjQIly
         WA81F5MbbT6RUk1KSdwnW5YSzKg4XilXbG2+MPJ4MsoA9KFKX1Qsh4GpVcpS9c4qe3cc
         KfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754320110; x=1754924910;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aQeYw4Fy84I8q6tvo5X2FdN9fKUrtRsLUFW/OPteVQ=;
        b=p3nSVDNTHg6t1t3tx3D0Fbox0IGDLJSRbYilUK9cQj4D9x4dPhmZlRVrS1nQbRjB9U
         l6NQGiYJtMAZg+RDT4XN5S7vtMRAHH8A3ViJ1UZWUGcBkj9Rgw6eqU7Ur2bPwU/YDxzo
         3bWUGCUFBNKY+GwLV/jXnFi061rUXkdIc+Io2igL6IohEHksLMFoPzjAIymFWh+z1i/J
         yMGphqLr4LP1zQeWvJTT4SAKUwOXlPQI9j3yrT15X8Zji8SttFh2h0H5hn7dy9D4GuIq
         kNRhnawe3wJLG3MeIe7oZgRePNA/ZXITpHV97TmJ5Yb+Lis4HRZRe1qekXW1f2JGrHHk
         AKtg==
X-Forwarded-Encrypted: i=1; AJvYcCU525r9GO+09Pz7et1y6n6yE/1Y/YgJfhnXHwqGF0p+yippbqs88YmrR4CB7Iw/z3g/+LOREPyU4xs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5rtZCbCf81JEWVOQKkah6Y0DnktDcTSzuQ3MtdRmSZkkOR/F+
	CzLgsd/PiW4TJ0YvmuMF6b0ENpj+n+YoP52Z7dA7wLu1wRYQv4RdxokDTSKL5kMuzLKVjto+lPQ
	SRX12yx/KMlbmWnFdAAosVXLb8GmaaQ4=
X-Gm-Gg: ASbGncvFGO1zkSVypHzIIC8kaHeIOwNoLseYzuKtf5xbLoed2Aga1XmXL0ug+Zcge7s
	6nMaP2vakC/SzfGXNi3YwzD34kdj9k0umFQIprRDXDzqf9z7Rzn7RStVhbLlGlngLIob0zdZxSy
	h8iMgTI6wW0VH04aIUkHVa20EOq/S+ipdFEAYvQNxLQiOADYaZDvOxJgD5fqRhWV83AL7/U3HQ9
	MC7j8w=
X-Google-Smtp-Source: AGHT+IHiMEv29FswFHnWgWXgd+qAPjBYOlubpCLisx5WYkRiXCyOv2fcxPaVS38locg6vk6asnznoG8AKmFujms2stA=
X-Received: by 2002:a05:620a:c55:b0:7e3:30ac:8cb3 with SMTP id
 af79cd13be357-7e6962676b1mr1146102085a.12.1754320109612; Mon, 04 Aug 2025
 08:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2xoeC0H2Zfw4-Mmp-0tONvz+ModOnCFF5+UaxvaNOprfw@mail.gmail.com>
In-Reply-To: <CAK3+h2xoeC0H2Zfw4-Mmp-0tONvz+ModOnCFF5+UaxvaNOprfw@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Mon, 4 Aug 2025 08:08:18 -0700
X-Gm-Features: Ac12FXxVMiNIx6Z21d0B89Wjz0UPq7FofcTtOhCndlw0AkaQzs2uVH9hqoTfWSo
Message-ID: <CAK3+h2ws7ck8=BD_nrNbzwAiJ7dOs3cjNJSFNHE87Y1ncmkr6Q@mail.gmail.com>
Subject: Re: loongarch bpf trampoline fentry_attach_stress test race condition issue
To: Huacai Chen <chenhuacai@kernel.org>, "cc: Tiezhu Yang" <yangtiezhu@loongson.cn>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, Hengqi Chen <hengqi.chen@gmail.com>, kernel@xen0n.name, 
	loongarch@lists.linux.dev, guodongtai@kylinos.cn, youling.tang@linux.dev, 
	jianghaoran@kylinos.cn, geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 3, 2025 at 9:17=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com>=
 wrote:
>
> Hi Chenghao and Huacai,
>
> the fentry_attach_stress test is from following commit:
>
> commit d459dbbbfa323165849451edb9690a933c210bac
> Author: Ilya Leoshkevich <iii@linux.ibm.com>
> Date:   Wed Jul 16 21:35:07 2025 +0200
>
>     selftests/bpf: Stress test attaching a BPF prog to another BPF prog
>
>     Add a test that invokes a BPF prog in a loop, while concurrently
>     attaching and detaching another BPF prog to and from it. This helps
>     identifying race conditions in bpf_arch_text_poke().
>
>     Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>     Link: https://lore.kernel.org/r/20250716194524.48109-3-iii@linux.ibm.=
com
>     Signed-off-by: Alexei Starovoitov <ast@kernel.org>
>
> https://lore.kernel.org/all/20250716194524.48109-2-iii@linux.ibm.com/
> restore the race condition fix.
>
> while reading s390 code bpf_arch_text_poke(), I noticed there is
> text_poke_sync_lock() at the bottom line 2431, I am not sure this is
> relevant or needed for loongarch
>
>  565 static void bpf_jit_plt(struct bpf_plt *plt, void *ret, void *target=
)
>  566 {
>  567         memcpy(plt, &bpf_plt, sizeof(*plt));
>  568         plt->ret =3D ret;
>  569         /*
>  570          * (target =3D=3D NULL) implies that the branch to this PLT =
entry was
>  571          * patched and became a no-op. However, some CPU could have =
jumped
>  572          * to this PLT entry before patching and may be still execut=
ing it.
>  573          *
>  574          * Since the intention in this case is to make the PLT
> entry a no-op,
>  575          * make the target point to the return label instead of NULL=
.
>  576          */
>  577         plt->target =3D target ?: ret;
>  578 }
>  579
>
>
> 2385 int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type t,
> 2386                        void *old_addr, void *new_addr)
> 2387 {
> 2388         struct bpf_plt expected_plt, current_plt, new_plt, *plt;
> 2389         struct {
> 2390                 u16 opc;
> 2391                 s32 disp;
> 2392         } __packed insn;
> 2393         char *ret;
> 2394         int err;
> 2395
> 2396         /* Verify the branch to be patched. */
> 2397         err =3D copy_from_kernel_nofault(&insn, ip, sizeof(insn));
> 2398         if (err < 0)
> 2399                 return err;
> 2400         if (insn.opc !=3D (0xc004 | (old_addr ? 0xf0 : 0)))
> 2401                 return -EINVAL;
> 2402
> 2403         if (t =3D=3D BPF_MOD_JUMP &&
> 2404             insn.disp =3D=3D ((char *)new_addr - (char *)ip) >> 1) {
> 2405                 /*
> 2406                  * The branch already points to the destination,
> 2407                  * there is no PLT.
> 2408                  */
> 2409         } else {
> 2410                 /* Verify the PLT. */
> 2411                 plt =3D ip + (insn.disp << 1);
> 2412                 err =3D copy_from_kernel_nofault(&current_plt, plt,
> 2413                                                sizeof(current_plt));
> 2414                 if (err < 0)
> 2415                         return err;
> 2416                 ret =3D (char *)ip + 6;
> 2417                 bpf_jit_plt(&expected_plt, ret, old_addr);
> 2418                 if (memcmp(&current_plt, &expected_plt,
> sizeof(current_plt)))
> 2419                         return -EINVAL;
> 2420                 /* Adjust the call address. */
> 2421                 bpf_jit_plt(&new_plt, ret, new_addr);
> 2422                 s390_kernel_write(&plt->target, &new_plt.target,
> 2423                                   sizeof(void *));
> 2424         }
> 2425
> 2426         /* Adjust the mask of the branch. */
> 2427         insn.opc =3D 0xc004 | (new_addr ? 0xf0 : 0);
> 2428         s390_kernel_write((char *)ip + 1, (char *)&insn.opc + 1, 1);
> 2429
> 2430         /* Make the new code visible to the other CPUs. */
> 2431         text_poke_sync_lock();
> 2432
> 2433         return 0;
> 2434 }
>
> void text_poke_sync_lock(void)
> {
>         cpus_read_lock();
>         text_poke_sync();
>         cpus_read_unlock();
> }
>
> I hope it helps :)


here again is the working code from Huacai:

struct insn_copy {
       void *dst;
       void *src;
       size_t len;
       unsigned int cpu;
};

static int text_copy_cb(void *data)
{
       int ret =3D 0;
       struct insn_copy *copy =3D data;

       if (smp_processor_id() =3D=3D copy->cpu) {
               ret =3D copy_to_kernel_nofault(copy->dst, copy->src, copy->l=
en);
               if (ret)
                       pr_err("%s: operation failed\n", __func__);

       }

       flush_icache_range((unsigned long)copy->dst, (unsigned
long)copy->dst + copy->len);

       return ret;
}

int larch_insn_text_copy(void *dst, void *src, size_t len)
{
       int ret =3D 0;
       size_t start, end;
       struct insn_copy copy =3D {
               .dst =3D dst,
               .src =3D src,
               .len =3D len,
               .cpu =3D smp_processor_id(),
       };

       start =3D round_down((size_t)dst, PAGE_SIZE);
       end   =3D round_up((size_t)dst + len, PAGE_SIZE);

       set_memory_rw(start, (end - start) / PAGE_SIZE);
       return stop_machine_cpuslocked(text_copy_cb, &copy, cpu_online_mask)=
;
       set_memory_rox(start, (end - start) / PAGE_SIZE);

       return ret;
}
