Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CFFD29B
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 01:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712107977; cv=none; b=S/+5OWbC2PZLhEkHdBJA2aHvAcvvQtFTbU2yyNvCKN1mQUbjiIPuLBUUY4oMQSHGBjyAB0RxiZAYkCgCwgs/WH424XrP/hlf+RLl1Oxun14B+QqcPG/x+cEeVer3vzWXd9MGVWmJ1QnE+GtCz9fNw4cShf99qtPrlAZFB8HP5qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712107977; c=relaxed/simple;
	bh=oqREDFbRsB5mY8hvUf0QtLekrY+T63pjwUoG14JNFrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nJGE9cu9sOgwwWP3iLj0UM8J/Od3MdtYWO+E7amtNLwZH3yako6TuIJSi+8sip/LL1Nnj0n4qIeZnxNy/dNv3pKVVapybXcakOIBn5BXrQyn0ifLw7x168DvKO1U9STLsezvptkKfzxt5DnKxDFMf6aSuzPQbLYcrF+7McbbjcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ROXWYpp9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ROXWYpp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712107974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ynux/F/qmq0vm7Pu7L1906YdTD8uR3G8JQyOTFf45Q=;
	b=ROXWYpp91NSKISF7J9x8LrvAvI6lUm+xNy4FQpLfnip+CIcXpvdv8gLKfb4nAVPS+5gArm
	7QyfKenTt2mo+8DQRGXE9fyQdw2fxFg6JdadLn/h1EuMFzsvnyDL+R2/bISlMPpMjV8Q3m
	4oJ4lHt+KJO4HcY329xN/O02KMAKoWo=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-maT4drf4Om6BhMnFIvoNnQ-1; Tue, 02 Apr 2024 21:32:53 -0400
X-MC-Unique: maT4drf4Om6BhMnFIvoNnQ-1
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-4d87c150d6cso934677e0c.1
        for <loongarch@lists.linux.dev>; Tue, 02 Apr 2024 18:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712107973; x=1712712773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ynux/F/qmq0vm7Pu7L1906YdTD8uR3G8JQyOTFf45Q=;
        b=JgeaB6MOsJNs9Hrq0Kd9Yu5kM4oH5ngn+B1giww9FFS+RbvXB+M2xSJtNkTTteDTOi
         qV5UFkiDJkheTXtDheA7XQGh4CjpY/YrWae76EeuCw7E0QkB9e5AFqKym2t6Od50sOM5
         YjITaQl8ntLMjhgLRRykbMM+Eou69PVGsl1+LkIyIl2Feu6v/83wY3lyisnbPX+3XpyB
         Zid+tgxcwW8F209i0F2b6RXAiEn/2tnl0BZGGl0lHvrnrtqyEqaMhCFTowMbssUEAm0d
         p7XB3y8eQItFe/n0/fMelDufMcCFlIQ7w0UD+zCneNQHLtcDUbx1fPU0iYNzzjig7RYM
         S34g==
X-Forwarded-Encrypted: i=1; AJvYcCWSqhra+hZvmng19rWfQR4UMEwDvvBuR+MzX8ZJw+3DDk5epOWmoaC2mBSGjueLj+O+ULV1smsd17CprMVy1WPkEW2HyL+8tamd
X-Gm-Message-State: AOJu0YyvryMtkaKLKaUb9eXKkrySYieVg/4RE3E5c8TZao+Biqe8gRrg
	aPQxjItRcMrV/c8SpMyEGz1yQoYWy/uDMs50yQ5rQ0I8F1jrjcNUcJuPXhSjI6/cYZTXOzFAU4U
	Xo/oBa+bOXUZQfBU2URG0kqRQdT9TQYfS96muEYuG+oMrg0X2NwVwZgV+MQ==
X-Received: by 2002:a05:6102:588c:b0:478:9533:a75a with SMTP id ju12-20020a056102588c00b004789533a75amr2155414vsb.1.1712107972842;
        Tue, 02 Apr 2024 18:32:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9+hYqxzCimkmspOuHcmCsRdwFLI47CvtrgBTMbK0H1Qo/OVIYE/CpCTqBmVGSH1xwK+vwHQ==
X-Received: by 2002:a05:6102:588c:b0:478:9533:a75a with SMTP id ju12-20020a056102588c00b004789533a75amr2155389vsb.1.1712107972182;
        Tue, 02 Apr 2024 18:32:52 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id qm18-20020a056214569200b0068ff8bda6c7sm6031687qvb.92.2024.04.02.18.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 18:32:51 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	peterx@redhat.com,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Ryan Roberts <ryan.roberts@arm.com>,
	loongarch@lists.linux.dev
Subject: [PATCH 1/3] mm: Allow anon exclusive check over hugetlb tail pages
Date: Tue,  2 Apr 2024 21:32:47 -0400
Message-ID: <20240403013249.1418299-2-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403013249.1418299-1-peterx@redhat.com>
References: <20240403013249.1418299-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Peter Xu <peterx@redhat.com>

PageAnonExclusive() used to forbid tail pages for hugetlbfs, as that used
to be called mostly in hugetlb specific paths and the head page was
guaranteed.

As we move forward towards merging hugetlb paths into generic mm, we may
start to pass in tail hugetlb pages (when with cont-pte/cont-pmd huge
pages) for such check.  Allow it to properly fetch the head, in which case
the anon-exclusiveness of the head will always represents the tail page.

There's already a sign of it when we look at the fast-gup which already
contain the hugetlb processing altogether: we used to have a specific
commit 5805192c7b72 ("mm/gup: handle cont-PTE hugetlb pages correctly in
gup_must_unshare() via GUP-fast") covering that area.  Now with this more
generic change, that can also go away.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/page-flags.h |  8 +++++++-
 mm/internal.h              | 10 ----------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 888353c209c0..225357f48a79 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -1095,7 +1095,13 @@ PAGEFLAG(Isolated, isolated, PF_ANY);
 static __always_inline int PageAnonExclusive(const struct page *page)
 {
 	VM_BUG_ON_PGFLAGS(!PageAnon(page), page);
-	VM_BUG_ON_PGFLAGS(PageHuge(page) && !PageHead(page), page);
+	/*
+	 * Allow the anon-exclusive check to work on hugetlb tail pages.
+	 * Here hugetlb pages will always guarantee the anon-exclusiveness
+	 * of the head page represents the tail pages.
+	 */
+	if (PageHuge(page) && !PageHead(page))
+		page = compound_head(page);
 	return test_bit(PG_anon_exclusive, &PF_ANY(page, 1)->flags);
 }
 
diff --git a/mm/internal.h b/mm/internal.h
index 9512de7398d5..87f6e4fd56a5 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1259,16 +1259,6 @@ static inline bool gup_must_unshare(struct vm_area_struct *vma,
 	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP))
 		smp_rmb();
 
-	/*
-	 * During GUP-fast we might not get called on the head page for a
-	 * hugetlb page that is mapped using cont-PTE, because GUP-fast does
-	 * not work with the abstracted hugetlb PTEs that always point at the
-	 * head page. For hugetlb, PageAnonExclusive only applies on the head
-	 * page (as it cannot be partially COW-shared), so lookup the head page.
-	 */
-	if (unlikely(!PageHead(page) && PageHuge(page)))
-		page = compound_head(page);
-
 	/*
 	 * Note that PageKsm() pages cannot be exclusive, and consequently,
 	 * cannot get pinned.
-- 
2.44.0

