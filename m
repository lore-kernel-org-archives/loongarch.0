Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1141B31AABE
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767018036; cv=none; b=EYwLT5UWGknVWA7Ul5OR+kjfSEMXNOv2twQ3vXuPJOGQNCB4OScTx/W1RyO/O0icYk46GMwYPrmCLfGsSET5cJwThh/ReAap1xXrBsLunzk8ERwgjIAYFeoGrzlTxiH7VpUdcCam/At0rfOWvPz8QnZ2p00YXEv9e325+MuO3n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767018036; c=relaxed/simple;
	bh=5QJ++AFvmfogtrUN4a0fBMa5IvH0wJTZNpmYFiqxjs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptjFUjHJJYLnU/mg/YCSAOBupRJlfC16Ko7p7CsJ1Q2jvpaYmhNBIcW1fwnq+qu5+8I+YwjtuAfFNy4qIAgbEq2iuyl2r5q99onSnlwh7U69dRXQsSbkj2S/Oac2TJbsr4+7/dCBK7cJ5uKjCcxvQPNpYCu8PnxsvNACbt58OII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0gvjyjC; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0gvjyjC"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-450ac3ed719so6026595b6e.0
        for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 06:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767018033; x=1767622833; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e007yG2Skbf3KR5PzHmbwLjVdg3gkGjb1eZAPsdnqA4=;
        b=m0gvjyjC9FnCytELEC4skdk6TCdGQoaZkYQNayvVVubh7MqMfXo5EHH1v3NCKx81Ws
         y0kqK5IiHgfxlpnIHpOyYA0nOwxtoOegzDdioORG41topsT1FuM9F+lbZ01o6fa6LZgU
         WeDAmObCewfINKlfhXwtir66woOLle6dzxLZJKjZ5n79OV0ahvcXMABdJn26+FiO1mhk
         uwwUE39fE7nMtNVHeKXsyZE5DfiDuVj1W1GlHbJ59qozMlw2Fi2ogvWSa+2ny1zH1aL8
         U6X0viKrc02FgEMtAIb2k8rh6GNBCG2kLnd1bKivMw+D9/V/dgg/tAYsjXtRbs0nsnhg
         vioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767018033; x=1767622833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e007yG2Skbf3KR5PzHmbwLjVdg3gkGjb1eZAPsdnqA4=;
        b=mna6TRTSAnVH/t32hedbeHCMufei5TVmAYNTMwfP8xKqWtJu+bm8ghhRhFdZsansZm
         uFkJOfkdQFs78wRIcqiqBcWZmBbg5TnXt2EJBsNKnVR0sMDD2CWOktNWMxq8Iw/sokpq
         8eG21DTXWRh0CHQ6vwWR/uay1/6yLBJ0jXAj9G5RB6n0y/WgKpezkEFXCYAoSlE3Svez
         tnyYksK3PvDMxhAhPlYoUPqadCB8ePa3ToFVDEYA3gsIi8C5iqJAfVy6dwjzdIgM2BVx
         Lht/wrqDRf3xTQkhkn9KFPX0Z7g05QQ4kiBe1AXg3sVJvI+gWk7QyqFGZswrJz1isbt3
         p+xg==
X-Forwarded-Encrypted: i=1; AJvYcCWxIQg/269RC0D1Zxa2AFZT/sBzcmdyIubDbmPVQeZ/c2EO6eZzO7NwQm/2XOYBU5chCca8dJWuXh4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcugDELas8KrFs6eRW/nwslacVTRbyRXJ1rO9mqJGK12onIN1w
	Zl50h+6WpgZDRiCjSqBraq/00THCQpr23sNrW4fJ+APRQ2j5U/xz7932j9FsHeVgmucUaURkkP6
	XRJy6l1FZ1V17R3lQWskq4iUVgDyslNY=
X-Gm-Gg: AY/fxX7L/mtcEr74hSbuLBj7hQN1NrpvCjWSPsjialxVhjcvb7Eu1QwI9wchSbHvw7a
	aKMUM/1Zl/eDT+PD675OPtDFCAFoFPoigP/VrhgAg9vzpucN/PwTdOQI7/DNMRO/DIAgfU30jwS
	x4FNhNAB59nb3IJ5+Mw9Bo/OWGmxowbYQDQvTWoIZxycwH22mKT7jPRrfTBNarE0VRxx6EWvxfh
	8bItW2TwTfk5ynKcnbfxwSAWUl+GAjugmlTyQRmUHSOecHS4qMAV3fmgqwx0fEbu2FTLQn8WqHR
	dy3STao=
X-Google-Smtp-Source: AGHT+IGKy+9wP2on9xI54Zjjmh+IKZvqrskm+aim9BlDVJcgl1KL2yoo/qKbXq+mzLP/C8AuY1vCtfNQkHlPXn30BUA=
X-Received: by 2002:a05:6820:4d44:10b0:659:9a49:9049 with SMTP id
 006d021491bc7-65d0e98b91dmr10194949eaf.20.1767018032872; Mon, 29 Dec 2025
 06:20:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251103-1-v1-1-20e6641a57da@linux.dev> <130f896382dc8f56ead371208d9809ec06c7400c.camel@xry111.site>
 <20251229150619.0000195f@linux.dev>
In-Reply-To: <20251229150619.0000195f@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 29 Dec 2025 22:20:22 +0800
X-Gm-Features: AQt7F2pXotyzAFjPqoQjGStWE5-z1P1HK15voye9z6KXgDW0dWQRUKTGXQPLlOY
Message-ID: <CAEyhmHTRVfDmwwH=_hPFUnFS-_ffALNUEVrSKiO9vEznfrUSSw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Fix sign extension for 12-bit immediates
To: George Guo <dongtai.guo@linux.dev>
Cc: Xi Ruoyao <xry111@xry111.site>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Youling Tang <tangyouling@loongson.cn>, bpf@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>, 
	Bing Huang <huangbing@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 3:06=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> On Fri, 19 Dec 2025 17:33:17 +0800
> Xi Ruoyao <xry111@xry111.site> wrote:
>
> > On Mon, 2025-11-03 at 16:42 +0800, george wrote:
> > > From: George Guo <guodongtai@kylinos.cn>
> > >
> > > When loading immediate values that fit within 12-bit signed range,
> > > the move_imm function incorrectly used zero extension instead of
> > > sign extension.
> > >
> > > The bug was exposed when scx_simple scheduler failed with -EINVAL
> > > in ops.init() after passing node =3D -1 to scx_bpf_create_dsq().
> > > Due to incorrect sign extension, `node >=3D (int)nr_node_ids`
> > > evaluated to true instead of false, causing BPF program failure.
> > >
> > > Verified by testing with the scx_simple scheduler (located in
> > > tools/sched_ext/). After building with `make` and running
> > > ./tools/sched_ext/build/bin/scx_simple, the scheduler now
> > > initializes successfully with this fix.
> > >
> > > Fix this by using sign extension (sext) instead of zero extension
> > > for signed immediate values in move_imm.
> > >
> > > Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> > > Reported-by: Bing Huang <huangbing@kylinos.cn>
> > > Signed-off-by: George Guo <guodongtai@kylinos.cn>
> > > ---
> > > Signed-off-by: george <dongtai.guo@linux.dev>
> > > ---
> > >  arch/loongarch/net/bpf_jit.h | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/loongarch/net/bpf_jit.h
> > > b/arch/loongarch/net/bpf_jit.h index
> > > 5697158fd1645fdc3d83f598b00a9e20dfaa8f6d..f1398eb135b69ae61a27ed81f80=
b4bb0788cf0a0
> > > 100644 --- a/arch/loongarch/net/bpf_jit.h +++
> > > b/arch/loongarch/net/bpf_jit.h @@ -122,7 +122,8 @@ static inline
> > > void move_imm(struct jit_ctx *ctx, enum loongarch_gpr rd, long imm
> > > /* addiw rd, $zero, imm_11_0 */ if (is_signed_imm12(imm)) {
> > >             emit_insn(ctx, addiw, rd, LOONGARCH_GPR_ZERO, imm);
> > > -           goto zext;
> > > +           emit_sext_32(ctx, rd, is32);
> >
> > The addi.w instruction already produces the sign-extended value.  Why
> > do we need to sign-extend it again?
> >
> Hi Ruoyao,
> I tried, it's not easy to do that.
> It's better merge this patch, then consider next step.
>

The test_bpf.ko test failed, so probably this is the wrong fix.

> Thanks!
