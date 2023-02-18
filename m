Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682E8ECE
	for <loongarch@lists.linux.dev>; Sat, 18 Feb 2023 10:53:32 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id j2-20020a17090a060200b00229eec90a7fso492682pjj.0
        for <loongarch@lists.linux.dev>; Sat, 18 Feb 2023 02:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9TwxY/+QXkZ8fBcKsVGyJDCPPvVyS+wPqYk8kS7rgxw=;
        b=Pr/yVWGbJIpx2S1kqActFcyvZuFJY7TAZp8TtgX7IQ8WO356vA3EW79D4hSJzM5S0u
         fX4jssoFgwoVikNRc8iwoxCVnPvjV4LKqvHQZvPbXpqfaB+EzFDUbtTz0HJYeQb6GdMC
         wp0gYIMHywmT3uVbXnHDlnC2NwrPpFcSoo5kkmcAO7zsILqYU/QcDfxC3ZevEj/pnxFd
         2CfPK4oA9lXQ7S3l/bWV0p+/43+GY7JYMZE65nqHDKgzCKRW4JhpP3C3j7xpvlXj/Y4W
         X2d1d6TXRd+NJFVbpm5CQh+CDPk1KdlpcipM3YjlfU8EbI+pXvwtx7Wvl8SS3R2Ql2ay
         n/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TwxY/+QXkZ8fBcKsVGyJDCPPvVyS+wPqYk8kS7rgxw=;
        b=bPAKUQEJ+MpvpqhrI2e9etIF7aXchK4O2GoeaU1trzlt9JJ3YXIjmMJpw5jXByQruZ
         RTg2QlRcXGe6edP40PqWWLCRqF7WfSp+KOyL/rNVzmEohNA1YGjiQobJ4NfzFVKvwGXa
         LJWyyTusu0/+1ztTR2mhOoaZDblcRI8zcGyD1dR8m1fRlo8qxGRiKU0F5T4+cTNY2oY2
         taTbOjy7OjA9pfXJ1Ig/YEIx2ZxOFrpCDLToBm91rd35EHIJAHhZJCaS8VKjlUD9a7NS
         vguck/L/ac4cCveC4ceuuYajODgbyMAtbJNXgGxTPT/8Y2r5D+8xgEbiwxoxBRQe7/4q
         Lx6Q==
X-Gm-Message-State: AO0yUKXhKRn1igOCY6ZGqYKeY5QD8SZwzeufGvdnIykQIjNM86/xvykA
	w2nJ1K3zm+N6PYgsBefhFO8=
X-Google-Smtp-Source: AK7set9F2IN0/X8ODA6RGcx1JbU5O0z7yoBeEix7U7LYPQgAiDiwCvKBLX19TDuJN+AasMKKaFSahQ==
X-Received: by 2002:a17:90b:33d1:b0:22c:afd6:e597 with SMTP id lk17-20020a17090b33d100b0022cafd6e597mr758152pjb.17.1676717611639;
        Sat, 18 Feb 2023 02:53:31 -0800 (PST)
Received: from localhost.localdomain ([43.132.141.8])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0e8100b00234e6d2de3dsm654839pjx.11.2023.02.18.02.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 02:53:31 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: bpf@vger.kernel.org,
	loongarch@lists.linux.dev
Cc: hengqi.chen@gmail.com,
	yangtiezhu@loongson.cn
Subject: [PATCH bpf-next] LoongArch: BPF: Support mixing bpf2bpf and tailcalls
Date: Sat, 18 Feb 2023 10:53:17 +0000
Message-Id: <20230218105317.4139666-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation already allow such mixing.
Let's enable it in JIT.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 288003a9f0ca..e70c846efaa1 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1248,3 +1248,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)

 	return prog;
 }
+
+/* Indicate the JIT backend supports mixing bpf2bpf and tailcalls. */
+bool bpf_jit_supports_subprog_tailcalls(void)
+{
+	return true;
+}
--
2.31.1
