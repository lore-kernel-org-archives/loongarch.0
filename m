Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDBD10E7
	for <loongarch@lists.linux.dev>; Sun, 12 Feb 2023 03:52:52 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso13923578pjj.1
        for <loongarch@lists.linux.dev>; Sat, 11 Feb 2023 19:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PgeDiep57yqZOM9tBJGHWCt+l/2GlmGGj/5BxR/KoUM=;
        b=jZQnfx7PEytHc9wBW0FT7w2XXaOwvsSMaNSDBSsXNwpynEUGG+JmhGx6cDjZhCOibh
         9v4k+N2zNN7EdmZ69KXx1j58MkmAKnqoPBKa4o2jszHOwKOw004VtM0/evZwWuTC7IPp
         kYmph3Y0MwThZSLMgFbI+H7EgNNTg8oySHHvI2OmUrDDxXGwIroNGPTczgt7CbDuR2Hz
         xOSTycNhJa2KuF0N0YHj+PpasAqzre2GVJj31dIUwsNEujV4Opy/vfMEJFCinKMq3zB1
         +L8xHQpJ2BPxOArZm1D3cA0a/XoeLgq8Xfy9X6524bvbnERBw94uU26C9l+/esjxjlcu
         D7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgeDiep57yqZOM9tBJGHWCt+l/2GlmGGj/5BxR/KoUM=;
        b=yvLTPX9l/7d/kNWhwOlX0Y5NIyolJvpt6MZSVrKgYUgO7y8Kt1OBCoUqtjPEALrN+C
         Zu5S7NkPME9DOPcuaWILVzzOQ6sSnz3v3bx4g+XVzEx+kvecsmcFsdveARWJzmS68O4n
         N7E954Ml9egGOO1MswVOWR4lkrr0bDlANWG1jidf6bttmfND4GDH9WE78pqb+He834Ei
         bf6bgSeboEet1tqR/gmFXcbecqYtPypW7gGqQNHGidnUuJ9Zwe9tCeDzfvDq1TAmHo7M
         W8gkFc3pH9i8gLdnNIsBi7Bbxs1quZ+9bqiTb7fKqgB8SFVi/X6WTKunT7BkUaqgppIi
         CDaA==
X-Gm-Message-State: AO0yUKVYlCZeu98d5mnyr7ycLclABdxrwTQviNlXY9yzCiXxJ7kHaXqW
	5yO6DQQgtnKag+mG/LvVJJk=
X-Google-Smtp-Source: AK7set+DCePLre4oTy3bjFr0clrDBIsqIeAwe7aiTJ+7oCIoo61sxgjMksnWkK6nWwAZGa9pFz5FxA==
X-Received: by 2002:a05:6a21:99a2:b0:bf:8aea:c555 with SMTP id ve34-20020a056a2199a200b000bf8aeac555mr24418942pzb.13.1676173972071;
        Sat, 11 Feb 2023 19:52:52 -0800 (PST)
Received: from localhost.localdomain ([43.132.141.9])
        by smtp.gmail.com with ESMTPSA id s1-20020a63dc01000000b004fab4455748sm5055399pgg.75.2023.02.11.19.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 19:52:51 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: bpf@vger.kernel.org,
	loongarch@lists.linux.dev
Cc: hengqi.chen@gmail.com
Subject: [PATCH 0/2] Allow mixing bpf2bpf calls with tailcalls on LoongArch
Date: Sun, 12 Feb 2023 11:52:34 +0800
Message-Id: <20230212035236.1436532-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset enables mixing bpf2bpf calls with tailcalls on LoongArch.

The first patch fixes JIT for function calls, like:

  [   29.346981] multi-func JIT bug 105 != 103

This is because we are emiting variable instructions for 64-bit immediate moves.
During the first pass of JIT, the placeholder address is just zero, emiting two
instructions for it. In the extra pass, the function address is in XKVRANGE,
emiting four instructions for it. This change the instruction index in JIT context.
Fix it by using a fixed 4-instruction sequence.

The second patch enables mixing bpf2bpf calls with tailcalls on LoongArch.

Hengqi Chen (2):
  LoongArch: BPF: Treat function address as 64-bit value
  LoongArch: BPF: Support mixing bpf2bpf and tailcalls

 arch/loongarch/net/bpf_jit.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

--
2.31.1
