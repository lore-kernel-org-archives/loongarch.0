Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618528;
	b=dU1k15BPfA0n0ypDeTS2d9y9RX6O2m7YZa5UmVUDCSBzpoCVFLqpGn4sXxFmNPTiOzHI
	 S+M68/bjeRtRSL9PgQjqQmjIwEH1PVHik3pIdvMnmZNSf8iJQTIyi+Ld/K6+jbvIC5YV5
	 r7fYF0uJoI8G+O7fj0YHALkak1gq+LYZF+nnRGAGGzhoUcXwRKWQ2EgGCiMIRq2YYGHFy
	 LCynwWcWkkR5SstKD4WstAgS9WYt85Md4Vvnsw/JOYLbV9dwyUUA2nA3H2nTYdfwTKOfp
	 t6P7njuR9u/X2Zij1Fim3+7VGqDPIrGZNvu+VJoE0khSAs+B1SjUOZNiDW07s8fkatg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618528;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=JqJcyBohCCmTzbrZNGYTNNTZHJuSiPVln17AJPhHdQk=;
	b=YQMh/lp+kmzDZt1DGHQRE0MWIBbsGii6uS3SL8tQm8wtg9HLWeXOC9XdXXPX+LJPOHt3
	 PsigrWSvMgOyjB6FgogBHsoGARmry+hWQ7gwNFKKxFXClkaVxVRhUZTGaOb4rPXUMYcRr
	 k/k9vHSOE0n9+5o+As8M8mRTmZ2GoEkeZsxJzt8CNBgE7BgANLVs6ctjXe5I7yew/Op7b
	 Pl1cBFnbjZ0lh+K/kg0GX6dThJE6a5htWQSaxYjnb93rtNoGUCO/itSkj2Z3C8wk/zmYp
	 RATgz2FIadvkjxKprd4WIypmzBm0CDCtx3ZM/ubmsjME859/mjEK7ecOqHH2lcniFQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NeJMQzqw;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234B160A381B
	for <loongarch@lists.linux.dev>; Mon,  2 Nov 2026 11:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 234B160A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NeJMQzqw
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E1BF2972;
	Mon,  2 Nov 2026 03:22:04 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 906F43F632;
	Mon,  2 Nov 2026 03:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618527; bh=t0SkgFkvYDykWTdwPClx+wiQRsFxgewU3m4qBQArb9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NeJMQzqwvJCGViHbJ7QrglEcV+sHE+Y7LmN8Mv9KRlpD1KsgVkRdJciC+OcIGK7Ag
	 luR4kD9pngLARUQXLPyQKeqzGp8WZsRMvLq6m0Yi96l+E6h6jYcb/XlccgGehaPKp5
	 sPYNbHXRsNYuX/TWYKOBUYKwQid6g9Lg7pUylVag=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:21:18 +0000
Subject: [PATCH RESEND v2 05/21] MIPS: mm: define pud_leaf() only when PUD
 exists
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-dummy_ptxp3-v2-5-78840b2ec73c@arm.com>
References: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
In-Reply-To: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
To: Russell King <linux@armlinux.org.uk>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
 Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
 Stafford Horne <shorne@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-openrisc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=yLp6pLFkEq1XlBsrO8HJPn9OYitILCqfI5l0JaR3PzY=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HIxBJSBNoM97Az+FdfadshzwrJE6Hk2Nn9Vz
 MKxgKY54myJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauhyMQAKCRBt1cPRWsUx
 M2E/C/4qpH/vx+lqCX8XvGB0nXajTdL1XeeI+ifzMxsOUQjJtT8tY/smDQ5SKrR6WinrXO6Ngc8
 WmJ6HXGoOoY6VCHl5ja78DeFl3o38mPbYI06PBowiBBAaaOBJkWomfxtw3g2ZgG4Uh1aqfv6fXp
 vwiLGY6gzsFsCz2pkFz/WVYHWeWqpPNYSc9pZpJinfslFX4hi/cKag4gdGQKNYILIYyJJvIlbNy
 BM+ngv4diTaMO/vug1mgTvnHEo8CA7knFGj0n3zq1xoj8KhWbK3mVzkWZUqO7kxKi9KP6At4d68
 cjOzafYZVtnW0n4cMsgFw6P6ue/iZVXDPbhXMFL2jnVeya9rQru/UtN3eOKJMxDQ4gIJ2i7xQeY
 6agNDrREyget33aj1qdFW+UzgsOEn063yBZc3RAdit42b8EUr85bUWAHsHJnOQnFedG3AFdIRv5
 S1T3ej8geq/V9IRjOPajCdzqh5MA+dmkNPfvhLTNuLYlId5s2wizCxEMs+pERzFa1A2c4=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

From: "David Hildenbrand (Arm)" <david@kernel.org>

In include/asm-generic/pgtable-nopmd.h, pud_leaf() has hardcoded
to return false as inline function, but it misses the "define pud_leaf"
part.

To prepare for fixing that, define pud_leaf() only when
__PAGETABLE_PMD_FOLDED isn't defined.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/mips/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index fa7b935f947ca..151f4d15bd12b 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -745,8 +745,10 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 
 #ifdef _PAGE_HUGE
 #define pmd_leaf(pmd)	((pmd_val(pmd) & _PAGE_HUGE) != 0)
+#ifndef __PAGETABLE_PMD_FOLDED
 #define pud_leaf(pud)	((pud_val(pud) & _PAGE_HUGE) != 0)
 #endif
+#endif
 
 #define gup_fast_permitted(start, end)	(!cpu_has_dc_aliases)
 

-- 
2.43.0

