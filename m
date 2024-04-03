Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9E814F7F
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712107979; cv=none; b=jBG9+eQ6+GkiSa34Hsv7BR6cKsfYcmW0u8WSx3qxwOMuFCo57PFkke/3wjOHoTHx+h2JHe6kEBBLUUoTV0LbVhgXTYu26xqpoKNC97lZxD6fnq1T5Lc5V4c8fLgMzq24ppqEv0S2ycZnXP1FWWOLVims9lNC+4bvlVBosZurjpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712107979; c=relaxed/simple;
	bh=z1GaugFYICjVSrn2n8rnHfGDwwW/vuxiZSFHEY4qUdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XDdfZwmnE4n5ARP9q4bLgqE29U/s9mUbZ0JzMtGcfAG7qvPv8sZwYwVnyGF3E/qj5B67qbxH2C3ZukD7GYm3wCh8mViSFeZz5CD6aLwz3cujmdnzUWkzOaNW7+f03f4l6Rnoi8lAYwRNHi8I9ODm33uAqZYndw59yjbKf8aawWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FdxrEUo6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FdxrEUo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712107977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PR/NBCt+5qJ4X31foyrecLlAlU9UbBCiiBiwAD7jaH8=;
	b=FdxrEUo6wFSgOOFz7oF5QcO+6f5q47MHFDEAYapSATTxnembeBln8wXXAuxo85BrJY2kU5
	ylmEUeGvGuCMmu2/tM6OxHQ+djz0/xE50pPskDl2hCM49Tm2+0oXTLN4TcCnyAzRcQZQA9
	AmkBzrCTRxSUYpuR5u4By93PNHzlNcw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-RvawHjjsOwiLaR5rbL24gg-1; Tue, 02 Apr 2024 21:32:55 -0400
X-MC-Unique: RvawHjjsOwiLaR5rbL24gg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-78a59dd45edso15816585a.1
        for <loongarch@lists.linux.dev>; Tue, 02 Apr 2024 18:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712107975; x=1712712775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR/NBCt+5qJ4X31foyrecLlAlU9UbBCiiBiwAD7jaH8=;
        b=XW7fY4UrT1BrseUPq2Slx/s3qP5kVPJ4RC14FcUv5694t+acmHy2do/PEomqJcXB2s
         A3zNiEsTRqdh4udZ4sf5XtSRPweQjYktxewAyjJOjZuz7lu9OWgmq0dIQXXJJDqP0TRi
         zTSHsVxJ8gkeyCiRJ5UwNzDKSxiWQc5gZARrocRfILNN5PzeQI4NLH1r1S4kb2tkq5FO
         jEwkLF5IqgoEMrsmMZ808uZIQvuTPDvtmOkbGir1HqkfSNVxVp+MP3tqsFAYMGp57J21
         Npx3K/54qlY7wmGcUm4W16apuXDWrwKn3CzZJ0qSWf1fuvEZ+E/m1DWeHWxQXbtSAlYy
         ZwAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/H/HksJY6J318J8P2Z2xJYXDnkFnFFzEiZN6xbLfWH+8SOFyK6XnGpQiFFlCO4ozfAXIfetw9WLFgT4KjJ6maNdM2a0siEJli
X-Gm-Message-State: AOJu0YzIF4IgCJD/4lWlU3usy90Dv1giWYEE7PGgbFiE1iMctq3tHP6T
	h1IhfNu/BzigpykyCjdJDCwxFewR1xWf2lI2kjpS8KnqFzo77AkqHpMR2buzyL4Y15wKxoA0MjR
	JPPqf4k+WRgcdgzpgplZTIUAy/hN2SfrfUE/JADi/lR7G3DlHRPr7s/rnvg==
X-Received: by 2002:ad4:46d3:0:b0:698:fc78:21ae with SMTP id pm19-20020ad446d3000000b00698fc7821aemr9828983qvb.6.1712107974908;
        Tue, 02 Apr 2024 18:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDjHRAOIt7pAcFSSzP58lew6Exi/iOo8/2ozkB/HO9HAPtSJzX+RWcE9OqEaW9cSxSEbXVlA==
X-Received: by 2002:ad4:46d3:0:b0:698:fc78:21ae with SMTP id pm19-20020ad446d3000000b00698fc7821aemr9828970qvb.6.1712107974456;
        Tue, 02 Apr 2024 18:32:54 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id qm18-20020a056214569200b0068ff8bda6c7sm6031687qvb.92.2024.04.02.18.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 18:32:54 -0700 (PDT)
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
Subject: [PATCH 3/3] fixup! mm/arch: provide pud_pfn() fallback
Date: Tue,  2 Apr 2024 21:32:49 -0400
Message-ID: <20240403013249.1418299-4-peterx@redhat.com>
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

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/pgtable.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index fa8f92f6e2d7..0f4b2faa1d71 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1882,9 +1882,13 @@ typedef unsigned int pgtbl_mod_mask;
  * code.  Now it happens too for pud_pfn (and can happen for larger
  * mappings too in the future; we're not there yet).  Instead of defining
  * it for all archs (like pmd_pfn), provide a fallback.
+ *
+ * Note that returning 0 here means any arch that didn't define this can
+ * get severely wrong when it hits a real pud leaf.  It's arch's
+ * responsibility to properly define it when a huge pud is possible.
  */
 #ifndef pud_pfn
-#define pud_pfn(x) ({ BUILD_BUG(); 0; })
+#define pud_pfn(x) 0
 #endif
 
 /*
-- 
2.44.0

