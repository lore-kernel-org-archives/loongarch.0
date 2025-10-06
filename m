Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5631632C8
	for <loongarch@lists.linux.dev>; Mon,  6 Oct 2025 05:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759728834; cv=none; b=ZPpLJtA0/D3j0J+JV/ZbkEQtc96tJzXWWfMmg21XjxrMhL9QEMYQLTKUz7PWpddcypgHkdlAqyY2mxNeZJUGiEsYwyvAKYoM8qUhtnLIylzjlaxiW3k88QLwDhQOzHLwIdTpgeQF//kbtmBQmpcdqPVw3zm7dM2TM/jexPKoYao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759728834; c=relaxed/simple;
	bh=y3gMO0KNAaNqGzR+fQh7cZNYZx1F2Kn4cSNidEY1e5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYkonlPD2Nqt4wXbOZ1XFNcV360y//0o7mvXOX0LkJU8HVIC+G0nBneeQTHx0cl95pIBK/XcCtHL3L6eTSdEwypHJxe9RJu7Pv33g65jbDoO9ceJGtL7j1NGs1hm+End3/N5SPQcE4Sk7+GaDyqzz3LRxP9SOT84Wkytf2TvPX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdXPwVg7; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdXPwVg7"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b5a631b9c82so2984146a12.1
        for <loongarch@lists.linux.dev>; Sun, 05 Oct 2025 22:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759728833; x=1760333633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swgNxQekLF3SURfpN31Pehztjj7C/oWplXJx2xwvWOw=;
        b=RdXPwVg7DbjV4y1FYn+VFWyCjHvhPOcsBjIYgAMvmaiSb5HGZwqDQz7aPHt5oVLtHP
         Tg1Php+8IqZ2xMMalOj5IHtuUOE5wrBL9gJOJVycRbzb1lj9Rw7+eiUGAhmbi4zl1PPp
         PR6OQ+23F+3uw2oAE8ZjauJK0TKpnb8H+yw3qAo3/OuizMf/l+GzFZZn6M7Y99kFuIUm
         ZfQxJ4wXCk6huXVn79bAqRF2gKF1bwyIpYwdLduUy6qTJaJXtAIcrkTt+HqoeDmw34R1
         umzHAzKpwGu7iWSmXVUbC+89go5PEF7A3TKa15JwkUKGBIGXqFJ7w8n6R9S9AlLSjlsk
         4hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759728833; x=1760333633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swgNxQekLF3SURfpN31Pehztjj7C/oWplXJx2xwvWOw=;
        b=aBMabbJnYvp15898Xih0VlejCxqAG8LeW8c+OihGEwLjHfJlD/cE8ykxYG6aMtu8N3
         X2b9UNCUQsU161hI2GrC5iHIzN8QG1yPS01Ycd1cDKFGZPd3tv2FT6J2zTCqWb1WV7Tm
         rPt1/LEz+4whBmFe1+9shyqHHyFL/EdLp59mr5TXhSMK3Etjjvpd+RzFl0ITdPx8G5ON
         ymAR/heoI1rzNv/DKUiE+hbvVAxa0oEmfOy5oOJnEKrbx34nH2asoiOoZDMTYotPMnLG
         nKi5LHWIAIG6Ezr81OMuIQ18tj2QbiB4dV3krAhUVc55sUZSqFQXT+8E/Ula58b8bt0n
         qzSQ==
X-Gm-Message-State: AOJu0YwvsmzNP+XKpiFr5yYxhfOZbmRngG8wloq4pEOeoeoG1i8666o1
	FJDfZOguShKCbxrYBA35KFvZRXhu6Omy4YhHQpbwJW92XxFuTSiHXNzW
X-Gm-Gg: ASbGnctIxb0yhJzOtBCzLxjTttMvyJVbhWB+Jac1nijQWqqzIlTUYspuj1Lz9dzd+Nq
	Olt+CE1MtDYoLtT9zA6BlXRgjnvyUZOSzuGQhLU8wMPV00Y7SHrEUJy7Oz88x5dxbZNS1Gb2Mhc
	MwkMAVD7sN7+juUaqwoinXprQs5lqcktnZl0Z+ALXxj975C7loKVPu8eycr6XjgTKkN+qMCZ9wd
	TtFZaR9QcVNFAErSINY7WZhrSingXkrjc4L0fwCJYI41yFSBoo8xsuRcgGlk7exTkZ+tNYmzhL6
	638YCJPT0iJqm05LVbB9tKlcDM81I1JfiUTp5KswvaPXqrX0ED+hPqsp3hJVTMWC0IlbQts5HS9
	KCB9p236NEi2f04j2O0PZ8JQdN0QBUc3lS1Gjo1wlhlMKrwedGUC/hSGyydRqPHdZfw==
X-Google-Smtp-Source: AGHT+IEM6eD/Qm37tHJqBkko/5RRkJwI869aj1Wwts78KEJhGiDj7nsMCGtwQQMmPul3teAAmMi8fg==
X-Received: by 2002:a17:903:1b2b:b0:26c:9b12:2b6d with SMTP id d9443c01a7336-28e9a5f7328mr133557315ad.38.1759728832638;
        Sun, 05 Oct 2025 22:33:52 -0700 (PDT)
Received: from devbox.. ([116.16.231.215])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b88fcsm120187075ad.84.2025.10.05.22.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 22:33:52 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 4/7] LoongArch: BPF: Zero-extend bpf_tail_call() index
Date: Mon,  6 Oct 2025 05:33:20 +0000
Message-ID: <20251006053323.193581-5-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006053323.193581-1-hengqi.chen@gmail.com>
References: <20251006053323.193581-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bpf_tail_call() index should be treated as u32 value.
Let's zero-extend it to avoid calling wrong BPF progs.
See similar fixes for x86 ([0]) and arm64 ([1]) for more
details.

  [0]: https://github.com/torvalds/linux/commit/90caccdd8cc0215705f18b92771b449b01e2474a
  [1]: https://github.com/torvalds/linux/commit/16338a9b3ac30740d49f5dfed81bac0ffa53b9c7

Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 83e623ce2908..9f868bf85960 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -280,6 +280,8 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx, int insn)
 	 *	 goto out;
 	 */
 	tc_ninsn = insn ? ctx->offset[insn+1] - ctx->offset[insn] : ctx->offset[0];
+	emit_zext_32(ctx, a2, true);
+
 	off = offsetof(struct bpf_array, map.max_entries);
 	emit_insn(ctx, ldwu, t1, a1, off);
 	/* bgeu $a2, $t1, jmp_offset */
-- 
2.43.5

