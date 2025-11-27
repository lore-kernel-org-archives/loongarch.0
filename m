Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29E229D26E
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 01:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764206110; cv=none; b=QdQeT0v7tT0NKLdYnAqG7bnE/wbf/alciLnCCo4yvUKQE+dpu6bshzIEWmPyGdYoY4yUUwTI0ANiUoPNLnrXjXU84kctG5pkvhSuLhYtKog/4YvK60DAgruvBWCIXxnJBzxxlXOggpVRcqbMYv3xWMvrVOiDr7VSdXX/Xkkpo5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764206110; c=relaxed/simple;
	bh=jbv/5yqfSa0KJ/IeA29hXhIEAtQ59RgN8Zbg7ZWt3Bs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=FvtvvnNi5rg7OD6gkAN6CnjdPe7vjkKv+BJdY4YTCwlgO8TT7URyGgf2WMpJLpEivRfQlX6UZZzAIZOp7FU3lLwrtGt55dVtpTkAdXlhnXKd70N0/qLSdZzb6yDa1iYcAuRQzonPujI+Le3fm/hac4pnWgVrUqxOv26iH+p8B+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOGo8X6H; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOGo8X6H"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b9a98b751eso242804b3a.1
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 17:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764206106; x=1764810906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YN0BTLFbTgqhPvFlS+d/VYwmsgL4p5TAnUdzEI0ntIc=;
        b=QOGo8X6H+yGapsyADiutPPfOTIRG5iRg1TGm3TDYXT+rT1Ohs//gYX6PCGihT/kt5/
         r3QcW6zyAWmCzkipBzlEO6J0YKFnpO1axTIweHn8SxcaoMvGQECyhoKQbz1Y3YUDbuW6
         MWcePbj/ymuWIi9yg+kp0uHWFnSsEm2ma7CDa/5tTXZC+EJRQ08xz+1CAg3oV/lLDrIc
         KELzKaGay32DS4p92sONrdERk6pA9pPW5luAIyW2ef3dC3YN4VX79Xs5AEh3OJxVYKbt
         gnQ5s/WaAVuSQspjQPjoxeWU7Ce2d22roJeIZNBO5sirGfBmo0pCRobcAZFoUH/T90HT
         yzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764206106; x=1764810906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN0BTLFbTgqhPvFlS+d/VYwmsgL4p5TAnUdzEI0ntIc=;
        b=Kl0lrS7MvP5orHuJZBuxyD1xNAbIRC+ZwFHZt67+tUlpSXahzVk5ECOFieG+E1L8ZY
         qitBeJ5U11Nuuc/BvilQQUqY8DMuvXbpqtvtpe0Pwv1Tvd0Vat80K4G0HEG8vEqNSfcf
         jngIaCL7WgwfDZ7TsSYurgQ4enmY4tzRoUB4S78ribbJwJEE3/OIaBfSGRkDeMQ1K7uz
         Z+oXY70U4jVRuWepXQ0tRAZ85ym0yunt9a+8vIGU5Fe1JnvV6c6CEJxrwmWKFxQGhYD2
         M+pSkSUrRfI2CC9VxHiAXUfLnvWY6s8Ix4oWOdWG0O9/Svrs5O4B/OOs47vLow0UthwN
         PNbg==
X-Forwarded-Encrypted: i=1; AJvYcCXk6bEDUuBlKDVE9jArS/RqEi1oEUuyxLVGoCsqnMKlNsjTgOhiIDZLjY/UQo4itiv1L+2NvU/WZQU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2Yy+NdX0X5mi2Infr5ZoJYrb93KtnDfHP/7YA4r2RxDwAO1Mn
	Pq9mhWgfyzkCpFEcVH8PKD8I7rTr0051XfDO4hQFeGjPEMjMeIo8cLTw
X-Gm-Gg: ASbGncvC+1lj+bU82B5PhhEtUuJb9LOAgmH+xvpB8UQT0j2h/mJ12Jg7SzLsSjZDqXC
	ynUlyj1mQv8yYTvKWjVE4ilXhK8yNBx3pbbyaUZDNBMGzxgYSwu3L6KdWNxdRyH+UPEQu5S03ha
	5kj6qhFG98z1RZtJYWEp9b8ZI/NTrCKRDinkTMm755cFhSGvlel/n7vC09qFQPTpU1hYiNWy6v3
	N4OfnK2vdBHgKHjMSLOKCwzSqJVyNt1a+1+L/PGmFjJOiBvT/wi4MGonAFxjGZH9FkQnlUcicYj
	BSOtmEgQ5S4NxhkpMb/U24zG7q0QdYq6mB/28l7wC7gp8nVJOUMYDPCxwuOTEGpSr4IU+PWWrLx
	KOfhv4y/iaK3Tdj/IV8qJ+y9d5d9CwquKgVUQk+LHGi8mcyEAPqYvU0p8oQw5WZlxfLasJBQ3Wg
	dUoRcwmi88Tv3w2fC1Hm22uhmv
X-Google-Smtp-Source: AGHT+IFOjeQ0nHa/gitKNf1wf8IwI8ZEjtO1qVKyyQQ31rBE2Lfq+ONwSrRkJugnArpqn7KBTPKjcA==
X-Received: by 2002:a05:6a00:114f:b0:7a4:f552:b524 with SMTP id d2e1a72fcca58-7ca8b2b16e0mr9121834b3a.28.1764206105589;
        Wed, 26 Nov 2025 17:15:05 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c414c226f9sm22447356b3a.53.2025.11.26.17.14.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Nov 2025 17:15:04 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: Barry Song <v-songbaohua@oppo.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Matthew Wilcox <willy@infradead.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Oven Liyang <liyangouwen1@oppo.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	=?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Nam Cao <namcao@linutronix.de>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying page faults after I/O
Date: Thu, 27 Nov 2025 09:14:36 +0800
Message-Id: <20251127011438.6918-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Barry Song <v-songbaohua@oppo.com>

Oven observed most mmap_lock contention and priority inversion
come from page fault retries after waiting for I/O completion.
Oven subsequently raised the following idea:

There is no need to always fall back to mmap_lock if the per-VMA
lock was released only to wait for pagecache or swapcache to
become ready.

In this case, the retry path can continue using the per-VMA lock.
This is a big win: it greatly reduces mmap_lock acquisitions.

Oven Liyang (1):
  mm/filemap: Retry fault by VMA lock if the lock was released for I/O

Barry Song (1):
  mm/swapin: Retry swapin by VMA lock if the lock was released for I/O

 arch/arm/mm/fault.c       |  5 +++++
 arch/arm64/mm/fault.c     |  5 +++++
 arch/loongarch/mm/fault.c |  4 ++++
 arch/powerpc/mm/fault.c   |  5 ++++-
 arch/riscv/mm/fault.c     |  4 ++++
 arch/s390/mm/fault.c      |  4 ++++
 arch/x86/mm/fault.c       |  4 ++++
 include/linux/mm_types.h  |  9 +++++----
 mm/filemap.c              |  5 ++++-
 mm/memory.c               | 10 ++++++++--
 10 files changed, 47 insertions(+), 8 deletions(-)

Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Pedro Falcato <pfalcato@suse.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Oven Liyang <liyangouwen1@oppo.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Kristina Martšenko <kristina.martsenko@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Wentao Guan <guanwentao@uniontech.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: Nam Cao <namcao@linutronix.de>
Cc: Chris Li <chrisl@kernel.org>
Cc: Kairui Song <kasong@tencent.com>
Cc: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: Nhat Pham <nphamcs@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org

-- 
2.39.3 (Apple Git-146)

