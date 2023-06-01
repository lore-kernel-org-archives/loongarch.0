Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39011878
	for <loongarch@lists.linux.dev>; Thu,  1 Jun 2023 04:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C31C433D2
	for <loongarch@lists.linux.dev>; Thu,  1 Jun 2023 04:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685594197;
	bh=QZIVYOfQMQfDIruN7rSg689YIbiJbkkfE8AKRfy2n5U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XjX+qO5TgZej3fh2HJQIqiOR5PxyL4koYuTQx2qeUwz0mw2WS7S8765bRMbrDCQVG
	 whIGCjOlXBTjeWiN2+LrCx+Or8mSlhjQdHY5MFaYnqKspwUjKhBsJekNkwwwC3A2tK
	 RRJ+PYWLTNVwk2Tc4E1sjjLY66LER3hFT6QIRdlz0YEtfE5QnejkEMpgjlFtCb1L5b
	 jav2+jHQW0E6lB/EBDYRssonNB4dhirDM2pvI3kpcWJ0B9czAKVTkvmbZ2ylsgGsMq
	 x3kGCiBqFY0IqxyFq7Pvs4DJbAWcMeNsAFCqYa1UhLYAOwr6LlCcKM6JbTbj+s1hsP
	 DnX5huppMSCjQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5147e441c33so1066360a12.0
        for <loongarch@lists.linux.dev>; Wed, 31 May 2023 21:36:37 -0700 (PDT)
X-Gm-Message-State: AC+VfDzE9KAL/HMVMQ6DbS2AhY0ykzTJufB9Fw2DqlU/1+gdogaX3G5k
	DBP0XDn016p/dX9+/3BBuLdG7as7gFUIMvv4UvQ=
X-Google-Smtp-Source: ACHHUZ7XdaYihX3P0occ4fimfrY7vXLE/b8sATTjW74eXROnZDFW1BQ/va3F8G7kmqLig8peXPPgGCGmqMpiLEgKGXM=
X-Received: by 2002:a05:6402:3511:b0:4fc:97d9:18ec with SMTP id
 b17-20020a056402351100b004fc97d918ecmr437472edd.21.1685594195535; Wed, 31 May
 2023 21:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com> <20230531213032.25338-23-vishal.moola@gmail.com>
In-Reply-To: <20230531213032.25338-23-vishal.moola@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 1 Jun 2023 12:36:23 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSEguewbRMD8w3u3tfSPt-Opy+i=jm_8W2+NtAP1OYSsA@mail.gmail.com>
Message-ID: <CAJF2gTSEguewbRMD8w3u3tfSPt-Opy+i=jm_8W2+NtAP1OYSsA@mail.gmail.com>
Subject: Re: [PATCH v3 22/34] csky: Convert __pte_free_tlb() to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked-by: Guo Ren <guoren@kernel.org>

On Thu, Jun 1, 2023 at 5:34=E2=80=AFAM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  arch/csky/include/asm/pgalloc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgal=
loc.h
> index 7d57e5da0914..9c84c9012e53 100644
> --- a/arch/csky/include/asm/pgalloc.h
> +++ b/arch/csky/include/asm/pgalloc.h
> @@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>
>  #define __pte_free_tlb(tlb, pte, address)              \
>  do {                                                   \
> -       pgtable_pte_page_dtor(pte);                     \
> -       tlb_remove_page(tlb, pte);                      \
> +       pagetable_pte_dtor(page_ptdesc(pte));           \
> +       tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));  \
>  } while (0)
>
>  extern void pagetable_init(void);
> --
> 2.40.1
>


--=20
Best Regards
 Guo Ren
