Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5251214F109
	for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 16:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714147967; cv=none; b=fTIqmylrpmliZAvd5P3OrD1GjgrEKXOwyARZ/FHSrOr6IzvvZtaDZvppeisc80YnXH1YmHxFAJRaU2nRZvO5VwK3k/g8FjbfCpzDVKXIcAOFtboqYTmzWdwHeZqZbdnFEah3Q0FUJqeGI0rRAknudqzuRRin6UxnKzOjv8t+8L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714147967; c=relaxed/simple;
	bh=VHk3yV3ykPgBDTFB6jGO3B/kKnE4mwuV8+QA4otgjj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KL27Z+sDHIxH1K705yK+ccXlGeK/FgzFYMkKttymsthX/f8/lqGyskaLhLnzS3EiQwTsQmt+S9s7ollSsfdpeRjkw7arHMa/8sfovgGionIdJ9dVMgoPyjlngw7gnxfy5NnkCnK4cCugyCH4UlBXo1pz9hGRhXU/uupqdRD2ev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iaVBsi9+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iaVBsi9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714147964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eYUqEa4yY2qzSFoFdIvLcLWvg/98iZ7Cq/Vjg2cb5Pg=;
	b=iaVBsi9+KvAPRxFNS7Tpx2ZfTKHOwWJXU8AR5ITqSqRR1neFprAUhkGAWqITtivyad7jyz
	wUdKxC1jXCM+keMcB0kWSmQV9WwfgfXFxEvbBOHRH4WD9VYWqzMRDkfiDq77AqN3QHPy+B
	aVsdPHVQgN3Of9mzpMc6Vj7bR9Yvhk0=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-1hjskWMzOkSK9ONiEscZeQ-1; Fri, 26 Apr 2024 12:12:42 -0400
X-MC-Unique: 1hjskWMzOkSK9ONiEscZeQ-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6eb607b308bso730684a34.0
        for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 09:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714147962; x=1714752762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYUqEa4yY2qzSFoFdIvLcLWvg/98iZ7Cq/Vjg2cb5Pg=;
        b=rRzDBaX5cOCZaMWzXA6UfD2s1AfGzMYTI53s09WcV9s01pKee50vsNbFH+a2kg6Jaz
         N1NDS2F7V+0dCax/TWrcPpgQURLm9zJRuGDuNdXfXoYPkKVAYciKFjikdpO6Vj+bUarT
         ZqY3Bd6b0rjrmGVH3r9rugzFokbZLV0hPGbiiS3RHXU1AUbPW85iTFzkx+gy4NurSkk3
         h1KR0tePuMULDxyZIUDpGtAqziiMvoapP7RKXGCR4QecRcFwoL3onfQiWv+sTEnSc/Eq
         lmEurmrtydztBDY5u0obYlJBn4Ege6x/hdWczg6YbD3ZkeCXOZEFj2yKfKSJ+98AvgqH
         2aKA==
X-Forwarded-Encrypted: i=1; AJvYcCUwRCZrGLCaG3KXLYx7LK5Uc/nJNnnnN+D9DTR0eLJvF2MsHAWekEp+711qBGdXmh4zGuUXELoW3sG/2sHfxBs5W7bcMKqHDTT0
X-Gm-Message-State: AOJu0YxkRKmx1dtJh2q7U3IjMMW6Ch0ha9cYf+tR0dDvwMwj5FH5/j1D
	pe1WHUzP8ldcqFzCN0M9PHwAsD7iecUiPyKsY6pjV/3LoiZ4drME7x9yCmdKO9ZcnTKnJWXkCw2
	hUzuyHEmeQeeStC6Ta8rEQvNbPK56NI+vaZ9Na3CRHPae32h0juk82jXE0GLhInUEZQ==
X-Received: by 2002:a05:6870:a40f:b0:235:3e97:ed24 with SMTP id m15-20020a056870a40f00b002353e97ed24mr3125226oal.1.1714147961408;
        Fri, 26 Apr 2024 09:12:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKK09FSsz1w18C9O+QSKywaneNtUpj/aPvoeb+SOH3u9egTJYXPSkxUgqSN3BOrRHAMYNm3w==
X-Received: by 2002:a05:6870:a40f:b0:235:3e97:ed24 with SMTP id m15-20020a056870a40f00b002353e97ed24mr3125169oal.1.1714147960484;
        Fri, 26 Apr 2024 09:12:40 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id m6-20020ac807c6000000b00434fd7d6d00sm8007149qth.2.2024.04.26.09.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 09:12:40 -0700 (PDT)
Date: Fri, 26 Apr 2024 12:12:32 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v1 1/3] mm/gup: consistently name GUP-fast functions
Message-ID: <ZivScN8-Uoi9eye8@x1n>
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-2-david@redhat.com>
 <e685c532-8330-4a57-bc08-c67845e0c352@redhat.com>
 <Ziuv2jLY1wgBITiP@x1n>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Ziuv2jLY1wgBITiP@x1n>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 26, 2024 at 09:44:58AM -0400, Peter Xu wrote:
> On Fri, Apr 26, 2024 at 09:17:47AM +0200, David Hildenbrand wrote:
> > On 02.04.24 14:55, David Hildenbrand wrote:
> > > Let's consistently call the "fast-only" part of GUP "GUP-fast" and rename
> > > all relevant internal functions to start with "gup_fast", to make it
> > > clearer that this is not ordinary GUP. The current mixture of
> > > "lockless", "gup" and "gup_fast" is confusing.
> > > 
> > > Further, avoid the term "huge" when talking about a "leaf" -- for
> > > example, we nowadays check pmd_leaf() because pmd_huge() is gone. For the
> > > "hugepd"/"hugepte" stuff, it's part of the name ("is_hugepd"), so that
> > > stays.
> > > 
> > > What remains is the "external" interface:
> > > * get_user_pages_fast_only()
> > > * get_user_pages_fast()
> > > * pin_user_pages_fast()
> > > 
> > > The high-level internal functions for GUP-fast (+slow fallback) are now:
> > > * internal_get_user_pages_fast() -> gup_fast_fallback()
> > > * lockless_pages_from_mm() -> gup_fast()
> > > 
> > > The basic GUP-fast walker functions:
> > > * gup_pgd_range() -> gup_fast_pgd_range()
> > > * gup_p4d_range() -> gup_fast_p4d_range()
> > > * gup_pud_range() -> gup_fast_pud_range()
> > > * gup_pmd_range() -> gup_fast_pmd_range()
> > > * gup_pte_range() -> gup_fast_pte_range()
> > > * gup_huge_pgd()  -> gup_fast_pgd_leaf()
> > > * gup_huge_pud()  -> gup_fast_pud_leaf()
> > > * gup_huge_pmd()  -> gup_fast_pmd_leaf()
> > > 
> > > The weird hugepd stuff:
> > > * gup_huge_pd() -> gup_fast_hugepd()
> > > * gup_hugepte() -> gup_fast_hugepte()
> > 
> > I just realized that we end up calling these from follow_hugepd() as well.
> > And something seems to be off, because gup_fast_hugepd() won't have the VMA
> > even in the slow-GUP case to pass it to gup_must_unshare().
> > 
> > So these are GUP-fast functions and the terminology seem correct. But the
> > usage from follow_hugepd() is questionable,
> > 
> > commit a12083d721d703f985f4403d6b333cc449f838f6
> > Author: Peter Xu <peterx@redhat.com>
> > Date:   Wed Mar 27 11:23:31 2024 -0400
> > 
> >     mm/gup: handle hugepd for follow_page()
> > 
> > 
> > states "With previous refactors on fast-gup gup_huge_pd(), most of the code
> > can be leveraged", which doesn't look quite true just staring the the
> > gup_must_unshare() call where we don't pass the VMA. Also,
> > "unlikely(pte_val(pte) != pte_val(ptep_get(ptep)" doesn't make any sense for
> > slow GUP ...
> 
> Yes it's not needed, just doesn't look worthwhile to put another helper on
> top just for this.  I mentioned this in the commit message here:
> 
>   There's something not needed for follow page, for example, gup_hugepte()
>   tries to detect pgtable entry change which will never happen with slow
>   gup (which has the pgtable lock held), but that's not a problem to check.
> 
> > 
> > @Peter, any insights?
> 
> However I think we should pass vma in for sure, I guess I overlooked that,
> and it didn't expose in my tests too as I probably missed ./cow.
> 
> I'll prepare a separate patch on top of this series and the gup-fast rename
> patches (I saw this one just reached mm-stable), and I'll see whether I can
> test it too if I can find a Power system fast enough.  I'll probably drop
> the "fast" in the hugepd function names too.

Hmm, so when I enable 2M hugetlb I found ./cow is even failing on x86.

  # ./cow  | grep -B1 "not ok"
  # [RUN] vmsplice() + unmap in child ... with hugetlb (2048 kB)
  not ok 161 No leak from parent into child
  --
  # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with hugetlb (2048 kB)
  not ok 215 No leak from parent into child
  --
  # [RUN] vmsplice() before fork(), unmap in parent after fork() ... with hugetlb (2048 kB)
  not ok 269 No leak from child into parent
  --
  # [RUN] vmsplice() + unmap in parent after fork() ... with hugetlb (2048 kB)
  not ok 323 No leak from child into parent

And it looks like it was always failing.. perhaps since the start?  We
didn't do the same on hugetlb v.s. normal anon from that regard on the
vmsplice() fix.

I drafted a patch to allow refcount>1 detection as the same, then all tests
pass for me, as below.

David, I'd like to double check with you before I post anything: is that
your intention to do so when working on the R/O pinning or not?

Thanks,

=========
From 7300c249738dadda1457c755b597c1551dfe8dc6 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Fri, 26 Apr 2024 11:41:12 -0400
Subject: [PATCH] mm/hugetlb: Fix vmsplice case on memory leak once more

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/hugetlb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 417fc5cdb6ee..1ca102013561 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5961,10 +5961,13 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 
 retry_avoidcopy:
 	/*
-	 * If no-one else is actually using this page, we're the exclusive
-	 * owner and can reuse this page.
+	 * If the page is marked exlusively owned (e.g. longterm pinned),
+	 * we can reuse it.  Otherwise if no-one else is using this page,
+	 * we can savely set the exclusive bit and reuse it.
 	 */
-	if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
+	if (folio_test_anon(old_folio) &&
+	    (PageAnonExclusive(&old_folio->page) ||
+	     folio_ref_count(old_folio) == 1)) {
 		if (!PageAnonExclusive(&old_folio->page)) {
 			folio_move_anon_rmap(old_folio, vma);
 			SetPageAnonExclusive(&old_folio->page);
-- 
2.44.0


-- 
Peter Xu

