Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358811C20
	for <loongarch@lists.linux.dev>; Sat,  3 Sep 2022 09:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474B1C433D7;
	Sat,  3 Sep 2022 09:57:21 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Shuah Khan <shuah@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Andy Lutomirski <luto@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH 2/2] selftests/seccomp: Add LoongArch selftesting support
Date: Sat,  3 Sep 2022 17:55:07 +0800
Message-Id: <20220903095507.3425208-2-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220903095507.3425208-1-chenhuacai@loongson.cn>
References: <20220903095507.3425208-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BPF for LoongArch is supported now, add the selftesting support in
seccomp_bpf.c.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 4ae6c8991307..e1c3b7d8ac39 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -128,6 +128,8 @@ struct seccomp_data {
 #  define __NR_seccomp 277
 # elif defined(__csky__)
 #  define __NR_seccomp 277
+# elif defined(__loongarch__)
+#  define __NR_seccomp 277
 # elif defined(__hppa__)
 #  define __NR_seccomp 338
 # elif defined(__powerpc__)
@@ -1751,6 +1753,10 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 				    NT_ARM_SYSTEM_CALL, &__v));	\
 	} while (0)
 # define SYSCALL_RET(_regs)	(_regs).regs[0]
+#elif defined(__loongarch__)
+# define ARCH_REGS		struct user_pt_regs
+# define SYSCALL_NUM(_regs)	(_regs).regs[11]
+# define SYSCALL_RET(_regs)	(_regs).regs[4]
 #elif defined(__riscv) && __riscv_xlen == 64
 # define ARCH_REGS		struct user_regs_struct
 # define SYSCALL_NUM(_regs)	(_regs).a7
-- 
2.31.1

