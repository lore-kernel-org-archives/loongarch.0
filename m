Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E009C94A
	for <loongarch@lists.linux.dev>; Tue, 18 Apr 2023 21:33:19 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-54f6a796bd0so361160417b3.12
        for <loongarch@lists.linux.dev>; Tue, 18 Apr 2023 14:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681853598; x=1684445598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZ+faik75720SnLDzvntxl1cmAaRHsLQ7oOmPoVPf3o=;
        b=fBPSS93aalbav0LUzUejRt2NjbHpBJmNsHVPRRbsF+jG5Nu8WjfWT+weSiXFGrkEbN
         Bl+EcMNC7lpcawm/MuwqggHfJmNk7zAK9haLpnJV08P367c5YohyB4lPm9ubYCuINJZG
         pmhBTFu6UKlSFmyU0QWGBEDpdg/7xojdmyIrq4CWcHgeoPLavovDZAMaCmQm5Tmi+PdF
         awAr9pJ9qRfL4qAoU/GIaaVF0Yb/A9oc1EXdyleFSucNiyAMBSWiFjcubi/Cl7MqSDQT
         LqfYl5LxNuy3TqKDTGZky+Cx6fyOI9+XqrTm2mW88NG+xvACaI/puCphU95FqO3MwFDd
         on2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681853598; x=1684445598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZ+faik75720SnLDzvntxl1cmAaRHsLQ7oOmPoVPf3o=;
        b=R5FRfUheEShuGERHhbUsfJNuauAoghBImFTxdKGp0NopVodjFENFu4XLTU+dXobTp9
         sOXUb2wwf2EcN34fHyRtXjCKHxYLjKID0vfpyFl5F/Ineo1GACBROuxSf+k/ANZucYux
         zhB42H1rUMEB3prgrkCw7LENYZDbiv6np/mAHwVy75gZqHKTpljhh7I94muY0NdUT2QT
         Oof46hEyB8CL80BM7m4Gz7/AECmRk01VWVOw9T/Rt0onGBRDVhEoFX8/m3Uw+PxdhALA
         FTK1AWRtQ/owxFS66ym1qJ8ccF/fRQJqWQ+8K8IxNaBV/mkmILaCXKW26d1s3RAQwMfw
         dUrw==
X-Gm-Message-State: AAQBX9dpAvYytlHCflrd6SDnK16uR69eW9asSbzvdoQcjqhBGQUfM1Ou
	A4BeoSLCsdZRmpAy5ufBf40Ou0swlnhrGfp4XKw=
X-Google-Smtp-Source: AKy350Zg9/w1pIq1h9Mfl98gkIvdjlXYVLE/yxlCrmuaudFEJKPjKGaCNnj1KVCOnrcLYZjlnD0Q2KC4cnvL5HhzBhY=
X-Received: by 2002:a81:8443:0:b0:54f:8af3:6488 with SMTP id
 u64-20020a818443000000b0054f8af36488mr1215032ywf.23.1681853598073; Tue, 18
 Apr 2023 14:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230417205048.15870-1-vishal.moola@gmail.com>
 <20230417205048.15870-2-vishal.moola@gmail.com> <da600570-51c7-8088-b46b-7524c9e66e5d@redhat.com>
In-Reply-To: <da600570-51c7-8088-b46b-7524c9e66e5d@redhat.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Tue, 18 Apr 2023 14:33:06 -0700
Message-ID: <CAOzc2pwpRhNoFbdzdzuvrqbZdf2OsrTvBGs40QCZJjA5fS_q1A@mail.gmail.com>
Subject: Re: [PATCH 01/33] s390: Use _pt_s390_gaddr for gmap address tracking
To: David Hildenbrand <david@redhat.com>
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

On Tue, Apr 18, 2023 at 8:45=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 17.04.23 22:50, Vishal Moola (Oracle) wrote:
> > s390 uses page->index to keep track of page tables for the guest addres=
s
> > space. In an attempt to consolidate the usage of page fields in s390,
> > replace _pt_pad_2 with _pt_s390_gaddr to replace page->index in gmap.
> >
> > This will help with the splitting of struct ptdesc from struct page, as
> > well as allow s390 to use _pt_frag_refcount for fragmented page table
> > tracking.
> >
> > Since page->_pt_s390_gaddr aliases with mapping, ensure its set to NULL
> > before freeing the pages as well.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
>
> [...]
>
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 3fc9e680f174..2616d64c0e8c 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -144,7 +144,7 @@ struct page {
> >               struct {        /* Page table pages */
> >                       unsigned long _pt_pad_1;        /* compound_head =
*/
> >                       pgtable_t pmd_huge_pte; /* protected by page->ptl=
 */
> > -                     unsigned long _pt_pad_2;        /* mapping */
> > +                     unsigned long _pt_s390_gaddr;   /* mapping */
> >                       union {
> >                               struct mm_struct *pt_mm; /* x86 pgds only=
 */
> >                               atomic_t pt_frag_refcount; /* powerpc */
>
> The confusing part is, that these gmap page tables are not ordinary
> process page tables that we would ordinarily place into this section
> here. That's why they are also not allocated/freed using the typical
> page table constructor/destructor ...

I initially thought the same, so I was quite confused when I saw
__gmap_segment_gaddr was using pmd_pgtable_page().

Although they are not ordinary process page tables, since we
eventually want to move them out of struct page, I think shifting them
to be in ptdescs, being a memory descriptor for page tables, makes
the most sense.

Another option is to leave pmd_pgtable_page() as is just for this case.
Or we can revert commit 7e25de77bc5ea which uses the function here
then figure out where these gmap pages table pages will go later.
