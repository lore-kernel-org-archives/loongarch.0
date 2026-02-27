Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CEC2E7635
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772186356; cv=pass; b=I7bMJmi4Bv3errBzs/2AZ3fJiZg0z7gwhwDEO4lHva1BeJsVPfcv6QA6IRuheWJ4gf1gzLoWQuqkVEDS69CR0F2FamW7cLRU5UFiQZiatjJgDJYk1XxXzEm7wZo+xwjB8Em67SxknopO0H+G+OwvFDdatTrufz7TgItcTOTmuUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772186356; c=relaxed/simple;
	bh=1vBVfxbWzORpb66HVlLCE2dd8V6VpJNY2GJfZMZOAKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VsICp9RXYyDU37ayfJtNCS65imF3RmsvGCD62lLBCjYCQu50o3OprZRX3QIjbDLMm2cWG3yrFtbflcJelCA0uER6cQm90zPuBWWr5woivPPo3a/Vfq4sdYphI25hQdWsZle2Lp2Ob3D6Q+M/pcpHjI0e1PfwruhBBOaASYFvQSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlUGGcIC; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlUGGcIC"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4638e6bb8a5so743165b6e.0
        for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 01:59:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772186353; cv=none;
        d=google.com; s=arc-20240605;
        b=UE+sZiLQIs2HWDJJ6klVuyw0fgYRePOIXlA45H6rZH7rByeq/jVSib4QhSDVpI5egy
         kfCsAi6QJZxLAC/SCiKhDImILx/FmOi83RtoLQVYEx3dGTBsa1h0r21fRzZS2/OvLs6E
         053fL/RuF3pvmw71ffNKjBx2SeaWMjfrfgf1eBgRTLRb6Qug202Z3awFXG2tzHK+qqRD
         GoZWDgbi8Z7IrhtTOQsHQzy8RmRznHPy1o82ec0j8oGnohhPULkv0Mqgh+BR9zCWYsXL
         Mc7YUybHxJXbyPn69uTY1p9NoyU7PU06Ch8Eo3b2f/t+Yb/ou/lHLB0R/S3yCI6JQUNV
         WwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZxbbYV5Eqxi7oT1bKKex/IDE3KfHdf0FkD5wvKYxJ8=;
        fh=gHfQJ8pNsqJFUk58gqABfqLKyBG8SRsCJ2O2LkQBK1Y=;
        b=e+F17IcOpO86q/v4DBdD7NbjQgR70eQdjfg8dnQO+tjSe3vGqWWKeGG8Akt1b8n6o3
         TFgWTVNm2xk2keZZY4EYnmd7iupR2fCYA0h5zKejl/m/i7Fgq3kavtIT7OoE9fRmBx0X
         91fxTJzFHmsjH1aYeUhLGNHnz1z2TmoZO7WMRDqs3pBbja5zatpl+FVsvzABatzjcfzO
         pJCk2xODTdds4JEGnZSt/zh93DLgiL91QmMvpTHBpCxFBkKudWTYnyI+n1FgWx1x4efB
         j8SaMnU5dC3IltWIHPEYL69EDp2Dn+q51KXCkotzxOGPwFeJY9U5aX2liKI742Q25giN
         bSkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772186353; x=1772791153; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZxbbYV5Eqxi7oT1bKKex/IDE3KfHdf0FkD5wvKYxJ8=;
        b=GlUGGcICmKeONkhQpT0WWH0pqOjdShlkgxTfVpDauKanYXMfpF19w/2VS0O7syrfJ1
         5ey9p+PbZOaOKFCT938kifsR5sdN8VKiIng9SgnqMlqLTCP/3HSj6joNKFUdvHpck4Hc
         A09F0+/h9i/gTXyww1LWhDmZXocow8+eN4V739zZFhedWv9r3W4tESe+DioosB6/vc0+
         xPFbK5mhX0JFFiSGwZNEgL0MW8XsCzk610acj0c9X9qlEvM67y0zp5a+W46ZPjk3O3Mw
         zF/B8kkXtVqddtRfL0G1Q+rFWyG0Xn2imNPwyV2NPViojEvZGo6YSIy/lIz0o1Ww+YGX
         ecBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772186353; x=1772791153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MZxbbYV5Eqxi7oT1bKKex/IDE3KfHdf0FkD5wvKYxJ8=;
        b=eIKY0qRzD5u8cAsQ7agK7TDKA3aM6w4y0gi5P8GuSDJcnx6cTrT+zmZB1HxnfVw1Pq
         eD1LLuK9E0SJ5pYclrXKnb+JY8PvNvHLdiYbzphcmguXmGwojAQSHZPzVgKOnkUfulpB
         IRlrjStGE8yrJ0NItcVoE1WRMSJUbOILWH38X6T69gDA8anzrFAHpWD19LbEjTOnoTgz
         hTKowAE/TiYCGBcQw/2QxmBYQFPe8cFpxC2nb8TwUNdor17Nz4BSCOlbSa6q5n/Lw0lU
         Dgb1EcyQ1CqL2yHIE8yb8lfW2HAf2n/+NgBVbk+WJ+VK1M95is+YSRellLZH/HTVmm3S
         1Mwg==
X-Forwarded-Encrypted: i=1; AJvYcCUmmrK8wRmNT4ioHMVNA6jgAWmu0tWYnEXQFD3ptREnIuzmQjqtg1cAqeDpDPSlYw9GIly2SpFFJgg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8UGOXNYuRxow4ZDMM9JOmF6S/prhrfCbDdW965aBcl45P/RH+
	7quzpEGl1lvCm54efjCVg8phozrvltzMLiLuKQkUTXMm2vXaJ6EDGndnl7KdGO4WLwubAPNnify
	HXDHmL6RFHecnB8eg1ArnSHW66eDGNKU=
X-Gm-Gg: ATEYQzwfVsdARRhvnJE5S3RhQQ8hthPtw97NZ2SzIBKUOvueimdWM+gPQYKdwTcaG0H
	cqkP2cBYlXRWybmZW/BZ7XaQWQAwgzJNrHOZ4YIVLlKzaOb2CCz7BbEJy5HRcVfVcduH6mYKmRV
	sbAmvTlPst592RqI3F0RGGchxInfK+Q+0Cbdlqqtmj9cJPMzCByy+TWMOjx0wlcgUYxQ2ljFldz
	pzTfROH4yvnzWftk3ki9XeZg436aql1JR8FT85eJ4deN6ZhP1d7QVTmOGjsRgeH4p4Qne6630J7
	duWGiASM
X-Received: by 2002:a05:6808:4f62:b0:464:1ecc:b95b with SMTP id
 5614622812f47-464becb2f6fmr1199762b6e.63.1772186353013; Fri, 27 Feb 2026
 01:59:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260227080351.663693-1-xry111@xry111.site>
In-Reply-To: <20260227080351.663693-1-xry111@xry111.site>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Fri, 27 Feb 2026 17:59:02 +0800
X-Gm-Features: AaiRm50JNpd6FGS0D9Ubgnt7sflVCqPk94W3Y__-LWd4REaI_QyZqSzreM1KbIs
Message-ID: <CAEyhmHTeDvWu1cZv59c80eZ31KjRtcXLcXuXphJ6_=oBk4rmZw@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Fix calling smp_processor_id() in
 preemptible code
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Mingcong Bai <jeffbai@aosc.io>, Zixing Liu <liushuyu@aosc.io>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	George Guo <guodongtai@kylinos.cn>, Chenghao Duan <duanchenghao@kylinos.cn>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 4:04=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> Fix the warning:
>
>     BUG: using smp_processor_id() in preemptible [00000000] code: sys
> temd/1
>     caller is larch_insn_text_copy+0x40/0xf0
>
> Simply changing it to raw_smp_processor_id() is not enough: if preempt
> and CPU hotplug happens after raw_smp_processor_id() but before
> stop_machine(), the CPU where raw_smp_processor_id() has run may be
> offline when stop_machine() and no CPU will run copy_to_kernel_nofault()
> in text_copy_cb().  Thus guard the larch_insn_text_copy() calls with
> cpus_read_lock() and change stop_machine() to stop_machine_cpuslocked()
> to prevent this.
>

I think you should include the P.S. part from v1 in the commit message.

> Fixes: 9fbd18cf4c69 ("LoongArch: BPF: Add dynamic code modification suppo=
rt")
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>
> Change since [v1]:
> - Add lockdep_assert_cpus_held() with a comment to prevent people from
>   calling larch_insn_text_copy() w/o acquiring the cpus lock in the
>   future.
>
> [v1]:https://lore.kernel.org/20260225141404.178823-2-xry111@xry111.site
>
>  arch/loongarch/kernel/inst.c | 10 ++++++++--
>  arch/loongarch/net/bpf_jit.c |  6 ++++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
> index bf037f0c6b26..7545ae3c796e 100644
> --- a/arch/loongarch/kernel/inst.c
> +++ b/arch/loongarch/kernel/inst.c
> @@ -263,14 +263,20 @@ int larch_insn_text_copy(void *dst, void *src, size=
_t len)
>                 .dst =3D dst,
>                 .src =3D src,
>                 .len =3D len,
> -               .cpu =3D smp_processor_id(),
> +               .cpu =3D raw_smp_processor_id(),
>         };
>
> +       /*
> +        * Ensure copy.cpu won't be hot removed before stop_machine.  If
> +        * it's removed nobody will really update the text.
> +        */
> +       lockdep_assert_cpus_held();
> +
>         start =3D round_down((size_t)dst, PAGE_SIZE);
>         end   =3D round_up((size_t)dst + len, PAGE_SIZE);
>
>         set_memory_rw(start, (end - start) / PAGE_SIZE);
> -       ret =3D stop_machine(text_copy_cb, &copy, cpu_online_mask);
> +       ret =3D stop_machine_cpuslocked(text_copy_cb, &copy, cpu_online_m=
ask);
>         set_memory_rox(start, (end - start) / PAGE_SIZE);
>
>         return ret;
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 3bd89f55960d..e8e0ad34928c 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1379,9 +1379,11 @@ void *bpf_arch_text_copy(void *dst, void *src, siz=
e_t len)
>  {
>         int ret;
>
> +       cpus_read_lock();
>         mutex_lock(&text_mutex);
>         ret =3D larch_insn_text_copy(dst, src, len);
>         mutex_unlock(&text_mutex);
> +       cpus_read_unlock();
>
>         return ret ? ERR_PTR(-EINVAL) : dst;
>  }
> @@ -1429,10 +1431,12 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_po=
ke_type old_t,
>         if (ret)
>                 return ret;
>
> +       cpus_read_lock();
>         mutex_lock(&text_mutex);
>         if (memcmp(ip, new_insns, LOONGARCH_LONG_JUMP_NBYTES))
>                 ret =3D larch_insn_text_copy(ip, new_insns, LOONGARCH_LON=
G_JUMP_NBYTES);
>         mutex_unlock(&text_mutex);
> +       cpus_read_unlock();
>
>         return ret;
>  }
> @@ -1450,10 +1454,12 @@ int bpf_arch_text_invalidate(void *dst, size_t le=
n)
>         for (i =3D 0; i < (len / sizeof(u32)); i++)
>                 inst[i] =3D INSN_BREAK;
>
> +       cpus_read_lock();
>         mutex_lock(&text_mutex);
>         if (larch_insn_text_copy(dst, inst, len))
>                 ret =3D -EINVAL;
>         mutex_unlock(&text_mutex);
> +       cpus_read_unlock();
>
>         kvfree(inst);
>
> --
> 2.53.0
>
