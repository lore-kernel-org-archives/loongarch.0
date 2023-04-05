Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EB633EA
	for <loongarch@lists.linux.dev>; Wed,  5 Apr 2023 14:17:47 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id i5so141672472eda.0
        for <loongarch@lists.linux.dev>; Wed, 05 Apr 2023 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680704266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gimnYVeRT5Ual27rDuwguD8QOIPyBqLLZeCy9UtpDHk=;
        b=i7Lwf1d+h99qQcQRPi1brnjQQkNsqbi82jDBwp2udTnqAeJTWtBLGDIA01yNQL6row
         ZgAoRWmGc+pF1uK7WnxxeRSty5vZbEXha74ihCXAp2M2hQWG3h4MQXSDq83PmjITTlEY
         1TEsdgXlIIHXegoxT+tvvL144fO9uavFxIsYm4xR+oWaHG/67Mbe3vXI2VQIx6RTBLau
         SUT61wOC+HjiaqVLtSkcGmdHyZ7effqqHEvmQaoyQ8ziHXviInyJiv5WpPRW5492RHM9
         tJ8EeAt4z9bcihE2b48t8jL5ajgHXKDZvGizKjCBFNbS9COTmew+128z7S+VL4vkDCxO
         yPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680704266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gimnYVeRT5Ual27rDuwguD8QOIPyBqLLZeCy9UtpDHk=;
        b=qkGutBv8vZXddpe23NgmEcjGhP6KN0FqzAA6440ASxRYgqViUKQJyheKsehBVPq81A
         sdPC4fZYbkQMT+3C3oTVLwpwdmVpFSZ36IsRtUztS5Cbkcyi8uZh4GNiuvFIE9S2Zy4t
         xGj2ZdLVD+qahWbEwuHDfXdeePqE/SL9w++e3s7VkCQp59RODHXL8aM47xz5DacBc7Za
         oDB3YBtSfW4kFNKQRBHVSdrXX+8V7D3aLEKiHfMvkphFzi6g/Ond3t3vMsZnDUa/8aj9
         Cymx3jVycBpyALvC3Ekgju5xpJGMisESb4DJI+oQqbt1ruG2ijd/x+mDAZ+BxvxbzAoO
         sPgQ==
X-Gm-Message-State: AAQBX9fF2UHL3NBsNWJW01bwzpqR21uF5nIY0H6AIKfV6P6cnWihpGbW
	mfuyc7Vvk0Wwi56juZUNjNg=
X-Google-Smtp-Source: AKy350ZLwW17aF+39vghcTuhCDYFbM0+I7GCNro7zTtnC9fuZakgWqGvzxqPQ4Er/diScFgX88yB5w==
X-Received: by 2002:a17:907:5c7:b0:928:796d:71e8 with SMTP id wg7-20020a17090705c700b00928796d71e8mr3874454ejb.3.1680704265983;
        Wed, 05 Apr 2023 07:17:45 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906348600b009334219656dsm7381246ejb.56.2023.04.05.07.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:17:45 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jun Yi <yijun@loongson.cn>
Subject: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Date: Wed,  5 Apr 2023 16:17:05 +0200
Message-Id: <20230405141710.3551-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add generic and target specific support for local{,64}_try_cmpxchg
and wire up support for all targets that use local_t infrastructure.

The patch enables x86 targets to emit special instruction for
local_try_cmpxchg and also local64_try_cmpxchg for x86_64.

The last patch changes __perf_output_begin in events/ring_buffer
to use new locking primitive and improves code from

     4b3:	48 8b 82 e8 00 00 00 	mov    0xe8(%rdx),%rax
     4ba:	48 8b b8 08 04 00 00 	mov    0x408(%rax),%rdi
     4c1:	8b 42 1c             	mov    0x1c(%rdx),%eax
     4c4:	48 8b 4a 28          	mov    0x28(%rdx),%rcx
     4c8:	85 c0                	test   %eax,%eax
     ...
     4ef:	48 89 c8             	mov    %rcx,%rax
     4f2:	48 0f b1 7a 28       	cmpxchg %rdi,0x28(%rdx)
     4f7:	48 39 c1             	cmp    %rax,%rcx
     4fa:	75 b7                	jne    4b3 <...>

to

     4b2:	48 8b 4a 28          	mov    0x28(%rdx),%rcx
     4b6:	48 8b 82 e8 00 00 00 	mov    0xe8(%rdx),%rax
     4bd:	48 8b b0 08 04 00 00 	mov    0x408(%rax),%rsi
     4c4:	8b 42 1c             	mov    0x1c(%rdx),%eax
     4c7:	85 c0                	test   %eax,%eax
     ...
     4d4:	48 89 c8             	mov    %rcx,%rax
     4d7:	48 0f b1 72 28       	cmpxchg %rsi,0x28(%rdx)
     4dc:	0f 85 d0 00 00 00    	jne    5b2 <...>
     ...
     5b2:	48 89 c1             	mov    %rax,%rcx
     5b5:	e9 fc fe ff ff       	jmp    4b6 <...>

Please note that in addition to removed compare, the load from
0x28(%rdx) gets moved out of the loop and the code is rearranged
according to likely/unlikely tags in the source.
---
v2:

Implement target specific support for local_try_cmpxchg and
local_cmpxchg using typed C wrappers that call their _local
counterpart and provide additional checking of their input
arguments.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>
Cc: Will Deacon <will@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jun Yi <yijun@loongson.cn>

Uros Bizjak (5):
  locking/atomic: Add generic try_cmpxchg{,64}_local support
  locking/generic: Wire up local{,64}_try_cmpxchg
  locking/arch: Wire up local_try_cmpxchg
  locking/x86: Define arch_try_cmpxchg_local
  events: Illustrate the transition to local{,64}_try_cmpxchg

 arch/alpha/include/asm/local.h              | 12 +++++++++--
 arch/loongarch/include/asm/local.h          | 13 +++++++++--
 arch/mips/include/asm/local.h               | 13 +++++++++--
 arch/powerpc/include/asm/local.h            | 11 ++++++++++
 arch/x86/events/core.c                      |  9 ++++----
 arch/x86/include/asm/cmpxchg.h              |  6 ++++++
 arch/x86/include/asm/local.h                | 13 +++++++++--
 include/asm-generic/local.h                 |  1 +
 include/asm-generic/local64.h               | 12 ++++++++++-
 include/linux/atomic/atomic-arch-fallback.h | 24 ++++++++++++++++++++-
 include/linux/atomic/atomic-instrumented.h  | 20 ++++++++++++++++-
 kernel/events/ring_buffer.c                 |  5 +++--
 scripts/atomic/gen-atomic-fallback.sh       |  4 ++++
 scripts/atomic/gen-atomic-instrumented.sh   |  2 +-
 14 files changed, 126 insertions(+), 19 deletions(-)

-- 
2.39.2

