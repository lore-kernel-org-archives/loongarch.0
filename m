Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F43379982
	for <loongarch@lists.linux.dev>; Mon, 16 Mar 2026 23:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773703398; cv=pass; b=PkkEI3Sx/GuUWNATkmZYPix72iiX//o0258Si3yRYGg4f6iQ9uLQpLvJ1u92V9FxLw/7JJzJbFPOESMZp/A7ttU90xt6of7IGMrKi8net2D7SdhfCLBzPgWb+XRfXQ/pzv+grMbIDCgUokqiuFzmK3jP/iay9FGYVORw+sRd/NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773703398; c=relaxed/simple;
	bh=XTOZYOCHUctLkYMS5qNPCkNocPEUYtAP2iODWNe7Wt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/QX0kU12U++MGM/3kr+kpy07J/+hshOOVmtEkOc7t7+yDfr8ZtQ3av7jOx50t717oyyKEJbJGJCCxdZA9Dhuy4yi7rrPT1I1iB0gEtytcGIrrQoDGxUOF4fwHR9PNpIxiByDM7lf0tTvXCkou/MuDapTaQ+STIXHp/rCrxzNBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=LdO9jSYK; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="LdO9jSYK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b062069f80so5537115ad.0
        for <loongarch@lists.linux.dev>; Mon, 16 Mar 2026 16:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773703396; cv=none;
        d=google.com; s=arc-20240605;
        b=a7d+bSDw3F3dbrqrkd5R/bfPe3h2iKnuLhc/2cm8fyOzPMyc4/YP2F2B7/5LsUiAwK
         UWbYRTy14nlxI1+wZwsxJz1FVO+uQ3oKUsq89il4L3XyPQiGbAZEk2/NL122Wp2lPA3W
         j7/weexunoDmijYBZERh2gFyMU1dUBd0yEaoHxOzOPcFyeNO9wDAbkIMVGr4Y4VoiNga
         FkLvyzO6RN880BrKNY4F8CswH7CcRmLmrjLC76EN5DAYuJAn0RzkPDHRr6TCUxUbaG71
         zy9nfKgahlkJsZ3/GAdFJZJDz0I9wt6Xp74u35SRUrq9qL+XjA0HSlAJBB8xotTIXCTw
         UTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OjoL/xI+JfK24mJlLYQ/qQdhvwGI+GcsV2kW/9vszrY=;
        fh=ojP7DoTcmcQvHSxfccMrpdzeXLKy7YNXfnSu3ocO6Gc=;
        b=I0JSp9s7mIMMVgLyEkgUo1qmPQY3BQtDkuwjNjsvY1fIoXAI0a0/pqmHroUDti79+J
         8QaisB37FFtCFWlJu2Mmui2e3HZsSieQgMnPDsLEs+5LZC+5DjsFlujtVIaZYF3bmZtf
         WEVopDzw4QRm8eNdoQXScmipmLvtpMlPYI/PjWK7++RBxgoWOM/hZdoCLpdcfNmf40Sa
         TKbFTw+gEt1Mm48lBmftfPLZfjvVCX/6+ajTNAtyC/PXyLYqj7jknPGHKZJB/e2xZZlW
         +moKfyxFfoMFB/a+yr3XXMlJzBg3Iarzq+hrilcMZrFQM0PCscl62KhewaVY3JaSzZFs
         klaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1773703396; x=1774308196; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjoL/xI+JfK24mJlLYQ/qQdhvwGI+GcsV2kW/9vszrY=;
        b=LdO9jSYKIkL3ML1LymYr++s5CGomsMIuLhIxdOIfFu/FXbsNhSgMpNUNS0PPZIDPY/
         yvh239TJihuqXYQ89oxikDiWgKGdwXs7NgZaxtCGK2qmknBtfJyR4DVnYgEWWetsS//Z
         tM79jZRkV1dUxrhM0t7sbvgHRoJdm56NK+fVD9Xxc04ZZ3tj67s5Dt1S8FgnIcvLMsx5
         MudYNQ+TXpmRvIlqo4MRcn3JyZVu5K/WP58v4PnK63uv4FZjzcuexgw3AN1QyBUJnrQO
         9CZB/m/n+mP6dRvpfV+uAhlg/unXqWVuhpDFhdaJqq71PxFmApyJaIuDAzgWsl9TwPKU
         uZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773703396; x=1774308196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjoL/xI+JfK24mJlLYQ/qQdhvwGI+GcsV2kW/9vszrY=;
        b=tDsIZ4VsiuSEBecs99gmB+orPfiDdYCQtktHUZ1lWM5i5n+vKhTlzm5kCG3YiwOaJV
         bpcj0cSWKZsJYAviwiFzcspJj9d3fwHVYVQ09N5Sa+jND8tQTuTMnuQFeRhqYIo9JaMn
         VrLWh61wE6KuR5apXJ1bPnyyO5ALB4lXnv1tHcvylSkBfJOAL/Y7DRBGHmFwwqGxO4Kw
         vdRTwGrkY8mDwTPh9i3M92KEmFnRxbCjsUTMUcaxDBXYxIjvOBgwrppPc91Q9DFsAdeP
         Mj5RvOWthxg4oK1xnbSMxUVNdJSSdgS6tya2XFUxSzBz/kiLf6aOsW5REom0wfsuodDh
         k5ag==
X-Forwarded-Encrypted: i=1; AJvYcCUdoGG1in4pIud0t0WxaeRsvsz8s/k9L15jm0VUEyfowSEQ19yb6wXlFVIhXYlAc2b+3dHppdcPTIo=@lists.linux.dev
X-Gm-Message-State: AOJu0YykVnyHeK6TqxD/QvBb34gUGbq/2z69tFbOmyTKjveuzKixjdOY
	/o4q3PmZLgdzdL4qquwERvAUYpmTmrVo1WV/bv0k9g3yLpho83sy/vyTOk58ds5YvIYNJd0L9Kc
	BQrWu3YDunB4TQy6IoGd/QROioN2U19qgYyqD3S2g
X-Gm-Gg: ATEYQzyKKv4BPzuKE8yo4IqpUYPDoGqWr5gHljkbiCV7xVZGdsImZvPGPKoFKnNj5NJ
	GE4fMPIj0ahW7Hb4NME0k+CG9h5ROHLQXwKVPxgpffwgf85VAfkLQc+CS0fgiCjtUyEn+QXOlWi
	oNaGBBJax6e5wecTqai4lVfwkG/Etq9tiEd91MBxFcmcss9ly21PFs/Ek8aujXIP9ZPEyWTNxb2
	iC6z8xpEqVbX7XNBTo17eywVrO+KCjM2adbZ/kfJ0jzk3Xz77qMxjVRvi90Ww9o83RJEDZwoq5G
	e6oos6niNvCekHOOHA==
X-Received: by 2002:a17:902:ea06:b0:2b0:5c3f:c0d8 with SMTP id
 d9443c01a7336-2b05c3fc4damr40223235ad.47.1773703396327; Mon, 16 Mar 2026
 16:23:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773665966.git.ljs@kernel.org> <063af0422d99bee0195589aa63f8f44edaf409fa.1773665966.git.ljs@kernel.org>
In-Reply-To: <063af0422d99bee0195589aa63f8f44edaf409fa.1773665966.git.ljs@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 16 Mar 2026 19:23:04 -0400
X-Gm-Features: AaiRm50DdYFqfixz3H6HRwMmLfdf5osoLUZfr0b1blDqz3IzGNPvd_xOI_ajOas
Message-ID: <CAHC9VhR2T8ujtfvz-HgkgSFByptTLmhbCYS+scY53aYg=sgfqw@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] mm: convert do_brk_flags() to use vma_flags_t
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kees Cook <kees@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Michal Hocko <mhocko@suse.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 9:09=E2=80=AFAM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> In order to be able to do this, we need to change VM_DATA_DEFAULT_FLAGS a=
nd
> friends and update the architecture-specific definitions also.
>
> We then have to update some KSM logic to handle VMA flags, and introduce
> VMA_STACK_FLAGS to define the vma_flags_t equivalent of VM_STACK_FLAGS.
>
> We also introduce two helper functions for use during the time we are
> converting legacy flags to vma_flags_t values - vma_flags_to_legacy() and
> legacy_to_vma_flags().
>
> This enables us to iteratively make changes to break these changes up int=
o
> separate parts.
>
> We use these explicitly here to keep VM_STACK_FLAGS around for certain
> users which need to maintain the legacy vm_flags_t values for the time
> being.
>
> We are no longer able to rely on the simple VM_xxx being set to zero if t=
he
> feature is not enabled, so in the case of VM_DROPPABLE we introduce
> VMA_DROPPABLE as the vma_flags_t equivalent, which is set to
> EMPTY_VMA_FLAGS if the droppable flag is not available.
>
> While we're here, we make the description of do_brk_flags() into a kdoc
> comment, as it almost was already.
>
> We use vma_flags_to_legacy() to not need to update the vm_get_page_prot()
> logic as this time.
>
> Note that in create_init_stack_vma() we have to replace the BUILD_BUG_ON(=
)
> with a VM_WARN_ON_ONCE() as the tested values are no longer build time
> available.
>
> We also update mprotect_fixup() to use VMA flags where possible, though w=
e
> have to live with a little duplication between vm_flags_t and vma_flags_t
> values for the time being until further conversions are made.
>
> Finally, we update the VMA tests to reflect these changes.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> ---
>  arch/arc/include/asm/page.h        |  2 +-
>  arch/arm/include/asm/page.h        |  2 +-
>  arch/arm64/include/asm/page.h      |  3 +-
>  arch/hexagon/include/asm/page.h    |  2 +-
>  arch/loongarch/include/asm/page.h  |  2 +-
>  arch/mips/include/asm/page.h       |  2 +-
>  arch/nios2/include/asm/page.h      |  2 +-
>  arch/powerpc/include/asm/page.h    |  4 +--
>  arch/powerpc/include/asm/page_32.h |  2 +-
>  arch/powerpc/include/asm/page_64.h | 12 ++++----
>  arch/riscv/include/asm/page.h      |  2 +-
>  arch/s390/include/asm/page.h       |  2 +-
>  arch/x86/include/asm/page_types.h  |  2 +-
>  arch/x86/um/asm/vm-flags.h         |  4 +--
>  include/linux/ksm.h                | 10 +++----
>  include/linux/mm.h                 | 47 ++++++++++++++++++------------
>  mm/internal.h                      |  3 ++
>  mm/ksm.c                           | 43 ++++++++++++++-------------
>  mm/mmap.c                          | 13 +++++----
>  mm/mprotect.c                      | 46 +++++++++++++++++------------
>  mm/mremap.c                        |  6 ++--
>  mm/vma.c                           | 34 +++++++++++----------
>  mm/vma.h                           | 14 +++++++--
>  mm/vma_exec.c                      |  5 ++--
>  security/selinux/hooks.c           |  4 ++-
>  tools/testing/vma/include/custom.h |  3 --
>  tools/testing/vma/include/dup.h    | 42 ++++++++++++++------------
>  tools/testing/vma/include/stubs.h  |  9 +++---
>  tools/testing/vma/tests/merge.c    |  3 +-
>  29 files changed, 186 insertions(+), 139 deletions(-)

Not that the SELinux changes are really all that significant, but they
look fine to me.

Acked-by: Paul Moore <paul@paul-moore.com> (SELinux)

--=20
paul-moore.com
