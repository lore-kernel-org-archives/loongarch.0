Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5762F2FCE27
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752771623; cv=none; b=JN7//YgQGXYq+jDo+Vk1Crdng5l/Q5mu/JO160zIidBq68enyZyWSk89pO7KJktXAbpWAoBuSZVkMiJUEIMqoMqnh7/Tqva7MMh4tln7WGRD0sR0Xi0b+DmoYDx9f1oGqA8BTtLFg6FpHEQgtHR0iwrxjrN1V83KQpat4TTseNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752771623; c=relaxed/simple;
	bh=SAWw6lgzY5ROkNWwrQz4wZc9ERv9Xj/v4mmxpUmi5e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=N5mwKTc2grZeuILzGcr8UFDYEe0w86nkkWSFd50Af0mO3jqRWNIfIPOpWSb88tiqZddeVvQnP43PqQ9AH+9+AK6xYrAFvEn4w3MZwbBjxWaPZBcoVUM859C76H8Ht/1QoaWRcYeBueuXkWGQB9Mv3ZgD9lU9JeJBkP+rNYLziTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIlsIdzn; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIlsIdzn"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ab9ba884c6so14107681cf.0
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752771621; x=1753376421; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9kzQuihJGQzW5bY9t0XpRipYthadJPZ9uSaFG+9YpQ=;
        b=cIlsIdznnF9BGTFHQKZ2Enc7CG6LjUhq87Ze8lJ7y6dD4WGt2wHcY5IrFRi0ad3Ioo
         0PurGn+w25xfhDrhq7U51WzAXfgVKGlgAiMK6vVbjiuyCS/gCCfICaf1bAiVHjfiE422
         gLD9bq2kaRON1jFVEiLe67JdOGZIPz4o08Yx3vdc63fEgEXzoIozhAa43/QNvCbzFbDE
         wfgtZZveyJ5JlJORUeNrCoqiKFgy8zaU3XoJCr9kAkOxZJRvFn5FOc0X1D6cG7r0ZPyc
         19aY2bk75M5iFiZD5a41HrMXFWwz2LbPc8wX1ZxYo1lT/0zw1t1u8kmRLdu4Zlu/hV1f
         wYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752771621; x=1753376421;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9kzQuihJGQzW5bY9t0XpRipYthadJPZ9uSaFG+9YpQ=;
        b=nengJcBscw7hxNqaLY/xWEYtKDhWsvSLFjUC5E6AjsXElCZa74wFbEHcBuxNOQHkxT
         ZoG1qyZTtUM6SRmZzUmRvCctm6NCjN3hFMZkfpWQ+4e2Kp8kLaqD17/1Shs44CCfJUUj
         tSgsMch0lAIrRjYCkB/lnE03vSM5P1CaxhOCWWUmGPjqAGwnPtnENuUYR9b3Oz6hHhkJ
         CjrfMy925+E2zenV57Hvihe1p4CWuemfXQEVcUAoh0cSzNI2A4tDlQaAvGXSgAN/8Hg9
         HhkBbqtS7VRL4Qt+fOiVYYx/uqBME76Q2b/ViWdVfXgwf2YqJYMLUfWqvroLTXtkcvpN
         5rHA==
X-Forwarded-Encrypted: i=1; AJvYcCVC51YqqCPcuycuPnoyzBI/PJ5ARPlyD6vUAEv/FAoHg3YRjV5lll44IADefsqq6SjIaQtuz4V26dA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPAfmuszeleWvjYrkIXps2wfmzXJbuyRysKkwHmjUOHdAxDSEj
	CcRtaNhRsABMy7Dnd2c8Wn9fMsILPWzssUON7Rihe/CeD/HM8PpZh019Uq7TcS0tUf/Fpef3TNB
	jlsdlp5TWLy5t4kacbtSwkuElAPoi3Lg=
X-Gm-Gg: ASbGnctMENpDYtDSHE3oF1zpdM7sKjyKgtSu3aVNHD0wDxG9Cx3Hb4pFy7Gc882vHGm
	uh3X10p1vQur+7ODVos5ExU1v54Hj9yxHNueKoyv7595bL0QX5KjPFZYjjllA5/NikGUgeWzFwA
	C3zhqfgHkmr4U/lQtoPi8scvXPG8Jaq2t3XgnNNzhInpcI57lRLkbNL2teTbwffSXnlKIORp/B7
	ylCFz0=
X-Google-Smtp-Source: AGHT+IGNxL4iJOOwvkEbESHl8JaWIeIaBFt9BgoxEp6N+bj2QJapDq2hBkb/aDLJjzXEC++cZgirtPSkklaivBUp9bM=
X-Received: by 2002:a05:622a:558f:b0:4ab:5b16:fa90 with SMTP id
 d75a77b69052e-4aba258dc6bmr63301431cf.12.1752771621104; Thu, 17 Jul 2025
 10:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2z9ByGD5wnk0=C=vML-OTv_22jZr2dn3u1O4Bs5V-YceA@mail.gmail.com>
In-Reply-To: <CAK3+h2z9ByGD5wnk0=C=vML-OTv_22jZr2dn3u1O4Bs5V-YceA@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 17 Jul 2025 10:00:09 -0700
X-Gm-Features: Ac12FXyl8ooH6TkGFfrt3po8ALsMrb11ceIsN2b7vWNuCX3LP52bFLairGHlJns
Message-ID: <CAK3+h2ybn=0fx2fNOerW1Ngy5fC9WX2NRNLOhGnRh_wRr5sghg@mail.gmail.com>
Subject: Re: loongarch *ip in bpf_arch_text_poke() missing 5 NOP
To: Chenghao Duan <duanchenghao@kylinos.cn>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name, loongarch@lists.linux.dev, 
	guodongtai@kylinos.cn, jianghaoran@kylinos.cn, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 8:12=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> Hi folks,
>
> Open a new email thread to investigate why  *ip passed to
> bpf_arch_text_poke() missing 5 NOP. from what I observed, in x86, the
> *ip already include 5 NOP when passed to bpf_arch_text_poke(), but in
> loongarch, the *ip is missing 5 NOP when passed to bpf_arch_text_poke,
> which result in -EFAULT in bpf_arch_text_poke() when memcmp(ip,
> old_insns, 5 * 4) in loongarch bpf trampoline patch series. I wonder
> if the loongarch bpf jit build_prologue() missed adding 5 NOP? x86_64
> emit_prologue() adds 5 NOP, what do you think?
>
> Thanks
>
> Vincent

I applied a rough patch below which added 5 NOP in build_prologue, it
seems to have solved the multi XDP program attachment issue, but it
also caused kernel lockup right after the program was attached, I had
to hard reset the power to reboot :)


diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 6820558afce5..66b00e265a73 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -93,6 +93,10 @@ static u8 tail_call_reg(struct jit_ctx *ctx)
  */
 static void build_prologue(struct jit_ctx *ctx)
 {
+       /* Emit 5 NOPs for later text patching */
+       for (int i =3D 0; i < 5; i++) {
+               emit_insn(ctx, nop);  // 0x03400000
+       }
