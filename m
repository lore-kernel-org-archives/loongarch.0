Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FD713FF5
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 01:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712107978; cv=none; b=DNH1T7scS7b/nAupY9GBSFgLMAdmn90T8K2HuzowSd/g6mOCVkBbijF9AUxdzIY4KWsLvutvHb75B2QRT6NqJC7kygsQGb0D9j0FyL4gXUYDjplZXUK5n6QBiyLSuF98TGXfk7/edkEvREJ6bTivXyFPpwzMyGb9KZ7fGDafURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712107978; c=relaxed/simple;
	bh=tDJsFCuEB0R3BpJAyJuzqy8CPWr5VO5Dk1p5YV+4YIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K3P1TnsBsZhrBiwLq8DOv1Le85nJEUSuzFM1nFBAA1qCFUa/H2lGLVBHjN0ipMAnTVOFKmMMfwR89d5LTkQpoVebznlC8ycul+2UA1WdCEBIHXXs7uIYF9il7wdL+/11F2WGkD02e02fYsaj6gTTaNSRDnRaNAK8SCn7Fm0IjMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SY6AX4Ij; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SY6AX4Ij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712107975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UqFcRORApCbbLwHiV/NvWvcvg5AC7kP7mUGUslgtJS8=;
	b=SY6AX4IjOjJimQe8gDAgQI5wTphgDRV6VTtHnamBJKu55d/xBMUL3f86YAmBjijftq+/Ow
	b6iYKcflMjBzILLVet5LkaWENNNcbJyV5eMK2K8AE9L3siYWfExHDVhMaKSFZgvaXKrGpz
	nteXs9Jrdyam3rIYHNWW5yozWQ4ZZWY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-mNdxgu_yMWmEeZONGXHJ4A-1; Tue, 02 Apr 2024 21:32:54 -0400
X-MC-Unique: mNdxgu_yMWmEeZONGXHJ4A-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-69925f44915so937296d6.1
        for <loongarch@lists.linux.dev>; Tue, 02 Apr 2024 18:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712107974; x=1712712774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqFcRORApCbbLwHiV/NvWvcvg5AC7kP7mUGUslgtJS8=;
        b=Q1M/Y6RNvNn6bj3gDrzDNn16AjvAr+0siRiGxNBlkp4ZHtGhsFV7krNIJLdlGW8rkZ
         W9psvigfL+hjy/fHZjZT45pGmGVpJfGJevyc/Ri4Mpt38ULtYr8DmPb/KYvNJfEsvq8p
         23o4MOLG+xpfyR4dN++pda+CgkfEq1y6jy1X6PkPuth5G8XlfPlj4wIMebR46UPr1VbW
         VnJzWCigN5iKgNa3DevV0HIP3PLub3OPqMm9WbolTS0IrMiNLZdHJ9TLGGlsjZrohAs1
         tJDhq9OUAV3zPgbXyS3N9Zr5s1oqVCbcLF6U5A/tKLBOKFMuzfHAIhOxW4XDfOHA/AZ5
         yxAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD5eMjCEX6pboQTtGo0wxL7c7HCTtE9Gp8ymdd6NAteNLJDiWJ3ww79Js3rh7/ssK/Of+KTtLdoGP6r19hpepLl5jdOTGkbQy+
X-Gm-Message-State: AOJu0Yw4LMVYpnuAs+HywfZinW4dLEBm9WGGh1BjDiC63ealDc9NGEFM
	ok24J0nGVkj7P4hhsaKFnV8HUMzwh41a5DqhiVMlaQq4hpKQMGDuX3QUyqkshPRJeEvUatwPFbm
	yNaTFLXeaYLOYkqp7z1wLHyUtz6Oz2s6nFnPMuq+LlWUuUf2j8y80JFQCWQ==
X-Received: by 2002:a05:6214:946:b0:698:ff21:99f6 with SMTP id dn6-20020a056214094600b00698ff2199f6mr9007651qvb.3.1712107973809;
        Tue, 02 Apr 2024 18:32:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdeiJvxhuNcK+1vYTZU0OZ0cczYLrBalyCYqNCwtKHKX2kkX+lMyBxEcKCdgdQrvrdhUD2Gg==
X-Received: by 2002:a05:6214:946:b0:698:ff21:99f6 with SMTP id dn6-20020a056214094600b00698ff2199f6mr9007637qvb.3.1712107973351;
        Tue, 02 Apr 2024 18:32:53 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id qm18-20020a056214569200b0068ff8bda6c7sm6031687qvb.92.2024.04.02.18.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 18:32:53 -0700 (PDT)
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
Subject: [PATCH 2/3] fixup! mm/gup: handle huge pmd for follow_pmd_mask()
Date: Tue,  2 Apr 2024 21:32:48 -0400
Message-ID: <20240403013249.1418299-3-peterx@redhat.com>
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

Allow follow_pmd_mask() to take hugetlb tail pages.  The old warnings do
not help now as hugetlb now allows it to happen, so drop them.

Reported-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 91d70057aea0..d60b63fcfc82 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -775,8 +775,6 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
 	assert_spin_locked(pmd_lockptr(mm, pmd));
 
 	page = pmd_page(pmdval);
-	VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
-
 	if ((flags & FOLL_WRITE) &&
 	    !can_follow_write_pmd(pmdval, page, vma, flags))
 		return NULL;
@@ -805,7 +803,6 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
 
 	page += (addr & ~HPAGE_PMD_MASK) >> PAGE_SHIFT;
 	ctx->page_mask = HPAGE_PMD_NR - 1;
-	VM_BUG_ON_PAGE(!PageCompound(page) && !is_zone_device_page(page), page);
 
 	return page;
 }
-- 
2.44.0

