Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9B112E4E
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 01:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712107976; cv=none; b=XI2OI5+uwwDasHX5seX8IsqNHyG7vHmjgWBKr+wyqyvEh5h24tHRRkHrieSerSDJ+1NpitwmCdAco5cqoZkEGT3MJMxG+7IDiK0Bl1DWSTkU2Zg1DqmDshKeotsO/OcX1+pgeMkPh1R5kjkCkUU3lopvN/ZjBMbWBjjaj17IZPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712107976; c=relaxed/simple;
	bh=4/F6u8iBxsSiMArRogpzgvWtl01wXfPkB0e+I+HV6ag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TML83VhQm+JadhQkkp3QYOxslfnDBMiYJLmEe/ynF9Cbxp96wnvP320QhIFZaDFzJj2Jp+fjLh5HwvbzV8q9cS3BotcSnFeBj6jieEelELAsaGQpEGFCP03UbxQSZLibcnJWiuMZpD1+o+o0UrXRbbO5ujZ92eo34Enf4DzJ08I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XIkIEnAz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XIkIEnAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712107973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=alQirahUTAy9XOHb1eUbW0PkaQ3ocBpN1TA8r3nGi4M=;
	b=XIkIEnAzxvqR2SF3mwW//kyyoAqcWaVKRwvFbDtUnc8y6QkgxPRT86hDB71QeH9UQZD4Dj
	zH1Jz1MuV8vIzmdPvnPy2RUpBXiNCUYb0VjwNplNJRKZzF3lYyYMej/ne3q67hkchn9qqC
	BhIdlK5YKGzgAb2P5Nbds1YM2s+vfEs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-8z05SPNfOp-7FtriNAblUQ-1; Tue, 02 Apr 2024 21:32:52 -0400
X-MC-Unique: 8z05SPNfOp-7FtriNAblUQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-69925f44915so937176d6.1
        for <loongarch@lists.linux.dev>; Tue, 02 Apr 2024 18:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712107972; x=1712712772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alQirahUTAy9XOHb1eUbW0PkaQ3ocBpN1TA8r3nGi4M=;
        b=p9TGZZAXzViu8mQlI5I1Bwqxr9e4bOV2q6UCfgiuv/1trRUjg8x1GeNWbCsjaOUpiB
         i5iPB3LJfW6HPu9ccQ2+okHP9SqtHZpoY0A2IBTuo3HW5jbSrfAOc8/Minn91n1eVwFe
         JGtbchF64rrpaPLgFTAxeyVxHdq1wVypdKnhmhnIFjeAmFzYzz+bBtmubWsTMpvV+PQX
         LUJEh04oQIAqMGxcfLtmGcyFYZbe941c7pK/LBHrb9T02+h7TVASYWTtoEvPAjz/nUwb
         vgSIDHql4FvFgqPEsDbrn2eSt1QluMpGKsl1yeUZBizL/pfJ2v/+0H0W8V01+FAvXCFj
         vkJA==
X-Forwarded-Encrypted: i=1; AJvYcCUYvckZErk2zENCSOj0mNOLgmLDN+lRmdKJ+bZLSBvYOO4Eek67TGVO1xGi6Mz9qp6KhMiffset7jY/PrvL1CV+GHfJyYa95hAZ
X-Gm-Message-State: AOJu0YyviBAVy8vKxBgmSaTh5blRnIjrtWPdhsPxe3u/+uPfaP6iW5Lw
	+yixBDD3NV1LvHqLm7c0wpjsnQrZqz7KATrWRfI7QND2LkwfIte2JxnA3IEi0kRR0pymvoki2RG
	B7cZ4FRFyY/K8AdzkTZFF4r2H8u2m9HQiF/Ga3R6Kotl75XMpAdC1AJOJog==
X-Received: by 2002:ad4:40cc:0:b0:699:278c:af6 with SMTP id x12-20020ad440cc000000b00699278c0af6mr312193qvp.6.1712107971665;
        Tue, 02 Apr 2024 18:32:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHzMOlQyMY3IEr2RcmrbH+njx1OvgJqSnMVNsfmQpLAp7UAnBpSBVsRsaCyba/ZRTay46pfg==
X-Received: by 2002:ad4:40cc:0:b0:699:278c:af6 with SMTP id x12-20020ad440cc000000b00699278c0af6mr312183qvp.6.1712107971127;
        Tue, 02 Apr 2024 18:32:51 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id qm18-20020a056214569200b0068ff8bda6c7sm6031687qvb.92.2024.04.02.18.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 18:32:50 -0700 (PDT)
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
Subject: [PATCH 0/3] mm/gup: fixups for hugetlb gup rework series
Date: Tue,  2 Apr 2024 21:32:46 -0400
Message-ID: <20240403013249.1418299-1-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Peter Xu <peterx@redhat.com>

Hi,

This is a small patchset that will fix two known issues that got reported
today on the previous hugetlb unification series on slow gup [1].

The first issue was reported by Ryan Roberts [2] on a test failure over
gup_longterm.  Patch 1-2 should fix it.  Tested with 32MB hugepages on
arm64 VM.

The second issue was reported by Nathan Chancellor [3] on a build issue
over loongson's defconfig (loongson3_defconfig).  It can be easily
reproduced with my own build setup [4], while patch 3 fixes it, and should
hopefully fix similar archs where pud_pfn() is not defined even if
pud_leaf() can return true.

For the 2nd issue, it's debatable whether it's an arch issue, because
logically speaking pud_pfn() and pud_leaf() should either be both defined
or both not.  But since the current fix will be the simplest and still safe
(I at least checked loongarch doesn't support either pud dax or pud
hugetlb), I think we can consider having this to unbreak the build first,
assuming this could also happen to other archs.

One note is that the last 2 patches should be squashed into corresponding
patch, while the 1st patch should be kept standalone.

Thanks,

[1] https://lore.kernel.org/r/20240327152332.950956-1-peterx@redhat.com
[2] https://lore.kernel.org/r/adfdd89b-ee56-4758-836e-c66a0be7de25@arm.com
[3] https://lore.kernel.org/r/ZgyKLLVZ4vN56uZE@x1n
[4] https://gitlab.com/peterx/lkb-harness/-/blob/main/config.json?ref_type=heads#L32

Peter Xu (3):
  mm: Allow anon exclusive check over hugetlb tail pages
  fixup! mm/gup: handle huge pmd for follow_pmd_mask()
  fixup! mm/arch: provide pud_pfn() fallback

 include/linux/page-flags.h |  8 +++++++-
 include/linux/pgtable.h    |  6 +++++-
 mm/gup.c                   |  3 ---
 mm/internal.h              | 10 ----------
 4 files changed, 12 insertions(+), 15 deletions(-)

-- 
2.44.0

