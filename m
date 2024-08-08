Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA1419007B
	for <loongarch@lists.linux.dev>; Thu,  8 Aug 2024 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723131110; cv=none; b=dWskVMch3b/eaiOh2z8qK5iibxU01hTocDcPyXwnnfi5yNB2yH02eV4+ZOzlqsuun2fMO/5BYfD54kBEpxK9FqzOpKCKt/lG6MUqY63vfrz49wuIu0iu59kEwOtuPsbt6ptNcz0S8can4P1BgsvNGDzbYVp70UtU0YZoJmWdGvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723131110; c=relaxed/simple;
	bh=ptVFr46xmXiBuy5zjVBGgin/uqh4pe4wAYi7ZKMHMBc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RBL+vn5FIm/ejn0SVtMIO3I2XzeM9/KhdcavDuwKz+MtSlZ6FODYfFgd4D+48exusYab96jxTimsx9OaPy/1NzFedbPo1HkuDB95nCaDMRTbk4A8X55s14BFWqRUISojLNv4FfiJK3It9CYg+X0WfP1vAY3BDoIlFyFeRaRyMVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=toxYc/bD; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="toxYc/bD"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1fc58790766so11407595ad.3
        for <loongarch@lists.linux.dev>; Thu, 08 Aug 2024 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723131108; x=1723735908; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jc21vP9HtcAG8Jx0fCnF54KV0nEotJ+OQOgwzr/gmUk=;
        b=toxYc/bDlImfChZrKVX6tD5paGGC77znNJ9/wEL/p66VJ5lNiMNZRlpocYQABU3u4k
         zWxNQV1gcbgpzMOxKQtbGxDSKAGO2//F4sq7SBN0gXTmEyx55jlfAJB/88NU4Ct/fX7s
         I2B0vW0NAKBOvrd64Sg9rkedGfZlC4WQbYDErfc4kxlosRGMgo/cEendNSVnblTU3AdR
         yIXcxbFeAYuldXQJvYfF58tlOx4xviZS2qAeoLR0CiTFu6x0HyWft+j1RByAlXMct0mo
         3UkQiQCuy5b8dAe0ZL8SKi7te5rTUHNrqWHc4uCf6jYqC4PDOe5668Bu0s5Xua4ehBCi
         32bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723131108; x=1723735908;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jc21vP9HtcAG8Jx0fCnF54KV0nEotJ+OQOgwzr/gmUk=;
        b=GyZKEWk7HGI/MZUoFxUibZv1cdM1NLAgURPrt97BmCVbLyknSMm6/lnstbeHVEPHQa
         BNZRzDmp+gXIeAo+IFyN+6xCwcOUVkzXfUlcXtE2Sa8VBJiimHQWMoXD4tvTK5Zno+nJ
         1B8tTI5rxHVlcrM02RWTw++XtTVkZGRw63dzpz+Wnb/of2450dMDGMWyIz/N4yea+Zj7
         bxjvKefdsfExMOwfbrNATcDgiGQ/LJP8GoWdnWeJm8kdB15+BGEiF73i3WE0w9NsT3mQ
         tqFVNxgaJ64OpXjJEfjIuE/au4CdL+IJ5euTGR+DJTULnDgVBUenoxFWPXvuPdoXOL3t
         O63Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9pu54ArOLCHZnHJf7R0vwn20Ajwou/crEANEEwftcu8Ad7HJ79dLbG3ocD3ZaIZCylcLiosiobw29rqgqMSlR2hJNXoYWLEop
X-Gm-Message-State: AOJu0YxS7h0JAySdu00vgx/ujel/YRWCL6ePg6E5Z3iaExCf5RI/yxZy
	emdydUyhPrH1WrJnV4aSSh3HPb18sPLY21dYghfmy/CAHRCgi0tODoaSOQKsqSYWxn0ESYeJZSV
	kDg==
X-Google-Smtp-Source: AGHT+IGhpuWFvPPS56LNIyARU7ozQJQwYhKu/y/lvyly0zz2F1cJP6/aGqiYnrRnxhwS3wYjMw23Fn2sh0c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2445:b0:1fb:7978:6cc with SMTP id
 d9443c01a7336-20095249cc8mr361865ad.5.1723131108261; Thu, 08 Aug 2024
 08:31:48 -0700 (PDT)
Date: Thu, 8 Aug 2024 08:31:46 -0700
In-Reply-To: <877ccrqc06.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-14-seanjc@google.com>
 <87bk23ql6n.fsf@draig.linaro.org> <ZrTFPhy0e1fFb9vA@google.com> <877ccrqc06.fsf@draig.linaro.org>
Message-ID: <ZrTk4sQS8k1-GBb3@google.com>
Subject: Re: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
From: Sean Christopherson <seanjc@google.com>
To: "Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2024, Alex Benn=C3=A9e wrote:
> Sean Christopherson <seanjc@google.com> writes:
>=20
> > On Thu, Aug 08, 2024, Alex Benn=C3=A9e wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >>=20
> >> > Now that hva_to_pfn() no longer supports being called in atomic cont=
ext,
> >> > move the might_sleep() annotation from hva_to_pfn_slow() to
> >> > hva_to_pfn().
> >>=20
> >> The commentary for hva_to_pfn_fast disagrees.
> >>=20
> >>   /*
> >>    * The fast path to get the writable pfn which will be stored in @pf=
n,
> >>    * true indicates success, otherwise false is returned.  It's also t=
he
> >>    * only part that runs if we can in atomic context.
> >>    */
> >>   static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *p=
fn)
> >>=20
> >> At which point did it loose the ability to run in the atomic context? =
I
> >> couldn't work it out from the commits.
> >
> > It didn't lose the ability per se (calling hva_to_pfn_fast() in atomic =
context
> > would still be functionally ok), rather the previous patch
> >
> >   KVM: Drop @atomic param from gfn=3D>pfn and hva=3D>pfn APIs
> >
> > removed support for doing so in order to simplify hva_to_pfn() as a who=
le.
>=20
> It still sticks out given the only caller no longer enforces this.=20

Oh, sorry, I should have been more explicit.  I'll fix the comment, I simpl=
y
missed it.
