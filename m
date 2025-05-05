Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58381A070E;
	Mon,  5 May 2025 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435434; cv=none; b=MukQ0mepQyInISAZg1NFS6hlEfShwB0can5Mh1GrZ0bMtvUnv7ds/VVXYb3lXbAsDcQRdT/Bld6GaaqJL9zo3SVug99XB4tEb9ltYKGQ+8kred1FkM19QF6Rebifd2Rzh+rQKqTdrv6EfZYiQJazc7QzEPabFj+Ro/8k7Xyz+p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435434; c=relaxed/simple;
	bh=J/Eo1wV9xLz2d1SVBAhlSLqb4O/nBCs2PoQohfIoNdM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=rF/2hAwqAIf12IklhMfophOZGzhfoecxFmC3YVHdzKRMk1CxQdxH04/p5hmhtOJRpXL0XGi+Qv84ybiMZqVs/Byyhp/9iP2cMmBJIVXHcm7QYojmevk/5hmMCDfxmZ4CqswwRfrWEj64AAzDMG75E3+dy4g3mQNNMGjgigv0Xqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jPPLjpDI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jPPLjpDI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8026C4CEE4;
	Mon,  5 May 2025 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746435433;
	bh=J/Eo1wV9xLz2d1SVBAhlSLqb4O/nBCs2PoQohfIoNdM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=jPPLjpDIg7oPamY3QSdrx9VTS1jbmbyCSyFd1w2Bw6BqS72SYj2qP8knQAQ60+rQp
	 kmeVXhq4vh8C96bZNHbx4N3dmnCM5AnEPIQ7EqPgqYe6TBppbMK1smjtKAW0jFvUUS
	 RSR7WldCj6KxRrxdcVI8fKEGCy1FkhNXVWpNPRD8=
Subject: Patch "LoongArch: Fix build error due to backport" has been added to the 6.1-stable tree
To: chenhuacai@kernel.org,chenhuacai@loongson.cn,gregkh@linuxfoundation.org,kernel@xen0n.name,linux@roeck-us.net,loongarch@lists.linux.dev,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 05 May 2025 10:57:10 +0200
In-Reply-To: <20250504021054.783045-1-chenhuacai@loongson.cn>
Message-ID: <2025050510-purposely-grinning-3997@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    LoongArch: Fix build error due to backport

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     loongarch-fix-build-error-due-to-backport.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From chenhuacai@loongson.cn  Mon May  5 10:55:39 2025
From: Huacai Chen <chenhuacai@loongson.cn>
Date: Sun,  4 May 2025 10:10:54 +0800
Subject: LoongArch: Fix build error due to backport
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <20250504021054.783045-1-chenhuacai@loongson.cn>

From: Huacai Chen <chenhuacai@loongson.cn>

In 6.1 there is no pmdp_get() definition, so use *pmd directly, in order
to avoid such build error due to a recently backport:

arch/loongarch/mm/hugetlbpage.c: In function 'huge_pte_offset':
arch/loongarch/mm/hugetlbpage.c:50:25: error: implicit declaration of function 'pmdp_get'; did you mean 'ptep_get'?  [-Wimplicit-function-declaration]
   50 |         return pmd_none(pmdp_get(pmd)) ? NULL : (pte_t *) pmd;
      |                         ^~~~~~~~
      |                         ptep_get

Reported-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/f978ec9a-b103-40af-b116-6a9238197110@roeck-us.net
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/loongarch/mm/hugetlbpage.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/loongarch/mm/hugetlbpage.c
+++ b/arch/loongarch/mm/hugetlbpage.c
@@ -47,7 +47,7 @@ pte_t *huge_pte_offset(struct mm_struct
 				pmd = pmd_offset(pud, addr);
 		}
 	}
-	return pmd_none(pmdp_get(pmd)) ? NULL : (pte_t *) pmd;
+	return pmd_none(*pmd) ? NULL : (pte_t *) pmd;
 }
 
 /*


Patches currently in stable-queue which might be from chenhuacai@loongson.cn are

queue-6.1/loongarch-fix-build-error-due-to-backport.patch
