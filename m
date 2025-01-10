Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBFE21E091
	for <loongarch@lists.linux.dev>; Fri, 10 Jan 2025 18:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534497; cv=none; b=Kph0/dB9u9XQ1BtyOhHO7FaGUC+c9AFf2cvTWxBJlcoTZmpawy5JYqpz1DMPiSok8BykF5CJEZikMDTdmJ3tJ3F63HTZmGeIDcrJKGiM5w9CsXzbTDU8Y8UmE9YhizZQJiqQltxuCdHlEidG5w+YWs7xloEqo6vAWE6QAuGBtNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534497; c=relaxed/simple;
	bh=ZTZcWQBF8tUo+J/JUKmX7ofVEYD/oEfP//Lw5p3vMVE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vp/38MzkTAtvm9g4U3bAZ3CThfrvrxa7gr8iDrr8zL+7Au9unbOgRhgmRB/YHcp9NPRcBPtFNZ9Y55YjanN/a0NSIztp+SIQTEcXNg2ZTV2SiTLcGsBCcPrI2LGW/DHR++391Z6OE2mJ0/MzlLjTfOoVs38ukg+VYD5L45RhwmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2z1Y7C9H; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2z1Y7C9H"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43651b1ba8aso16457275e9.1
        for <loongarch@lists.linux.dev>; Fri, 10 Jan 2025 10:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534475; x=1737139275; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DqQy0/uo7rp5xt5hxwNN280PfwFL6RX7EFGPCdWY0es=;
        b=2z1Y7C9H1kCWrPOZ2vXOfNbi0UtsiAcjCnyZ5JTOyCrnCg9P+hGHX2CEAY10Fot8Fc
         7SylPu4k/BymFB71boRFZDc1hb4atNOxRNgGjagjdlEAtfv2awKHIqvLf5m4k+nA1Bti
         f57lbjuJrc/vpCUntroo04GCP64Maunn8K7WV7ddF4XohXOGGKwdIgc0fiaNjBwOZCKk
         uM82eEFvfG+ofXVTcTae1wShGYWgxfQvDfGDHYoxVdZIxPPCNsajMG1mCCXt8uypMMB2
         gnZM37oKJ83TC1ayP6+yFPMZw+q+73gkp0Qm7tH9enpTqBgNLOpNEHfNAozu38JF/Z6I
         OIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534475; x=1737139275;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqQy0/uo7rp5xt5hxwNN280PfwFL6RX7EFGPCdWY0es=;
        b=F2SD0IQjE6rEzFVHh27rzp1L724xpoNrrYiBSRiUfN40vpEkxacIzFUbKBmOCjzywg
         f2vOA73cqkMhZnNnZdF8xs44wShwqt0P5wJ8VjzJy66YCs7nWfY1hhRGK35odWME66AB
         Uqk5e6JAOoO8XdfyilB5uE51fz6lNc0tLZF865Cu9hDNWMmz3K9OMORkPOW05CjNpqxC
         my8r+/Au2nfjKi9ehLiSNsBaeufbA0b3ZysUVp3A16m2iKm/ZOMSrYW3z/IKcLkdkdAV
         t/umZommN+KW6Tj+5d4IgvRaNYDza+xID5LWxQQAvhh9lgnOjvIvMuPA7ck0ogRzZAAG
         J+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBYUmiFeo3PwxliCYOviY8ybIqDxDJjNt3gDBq7A7Ua+lRZ44wos51k6jC5xUFcGCU42eP85KQuDI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCmu81dycpy6cC8Av721zeXkWnpWqJoRqGZwjotrjwQabSLHQm
	8zKiOTDlVvqR2rp0+PaLt7aTRFMOMCggJFaLhkAcKRsKgttHwXi1u48xOogSl8Is00toeafOO4s
	Bzebr4gjMfw==
X-Google-Smtp-Source: AGHT+IEHMyjAf4Ii6uANDaoYyo5ZkF+D1/fwKOgm4kaaSXfegc+L5vVxTYn6WIEloGlJDmt93RFbSdb2jTZqKA==
X-Received: from wmbjt19.prod.google.com ([2002:a05:600c:5693:b0:435:4bd2:1dcd])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e44:b0:434:e9ee:c3d with SMTP id 5b1f17b1804b1-436e27070b1mr106983675e9.20.1736534474969;
 Fri, 10 Jan 2025 10:41:14 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:39 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-13-8419288bc805@google.com>
Subject: [PATCH RFC v2 13/29] mm: Add __PAGEFLAG_FALSE
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

__PAGEFLAG_FALSE is a non-atomic equivalent of PAGEFLAG_FALSE.

Checkpatch-args: --ignore=COMPLEX_MACRO
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 include/linux/page-flags.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index cc839e4365c18223e68c35efd0f67e7650708e8b..7ee9a0edc6d21708fc93dfa8913dc1ae9478dee3 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -484,6 +484,10 @@ static inline int Page##uname(const struct page *page) { return 0; }
 FOLIO_SET_FLAG_NOOP(lname)						\
 static inline void SetPage##uname(struct page *page) {  }
 
+#define __SETPAGEFLAG_NOOP(uname, lname)					\
+static inline void __folio_set_##lname(struct folio *folio) { }		\
+static inline void __SetPage##uname(struct page *page) {  }
+
 #define CLEARPAGEFLAG_NOOP(uname, lname)				\
 FOLIO_CLEAR_FLAG_NOOP(lname)						\
 static inline void ClearPage##uname(struct page *page) {  }
@@ -506,6 +510,9 @@ static inline int TestClearPage##uname(struct page *page) { return 0; }
 #define TESTSCFLAG_FALSE(uname, lname)					\
 	TESTSETFLAG_FALSE(uname, lname) TESTCLEARFLAG_FALSE(uname, lname)
 
+#define __PAGEFLAG_FALSE(uname, lname) TESTPAGEFLAG_FALSE(uname, lname)		\
+	__SETPAGEFLAG_NOOP(uname, lname) __CLEARPAGEFLAG_NOOP(uname, lname)
+
 __PAGEFLAG(Locked, locked, PF_NO_TAIL)
 FOLIO_FLAG(waiters, FOLIO_HEAD_PAGE)
 FOLIO_FLAG(referenced, FOLIO_HEAD_PAGE)

-- 
2.47.1.613.gc27f4b7a9f-goog

