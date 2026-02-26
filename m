Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4187B2BE641
	for <loongarch@lists.linux.dev>; Thu, 26 Feb 2026 07:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089232; cv=none; b=NQhl7ynfFpSh3XitlkcfyXIZJUYMmAWszkru7CN/MHQgAam+81YCG3M7xsSZ+9CW1gXTPSUe4F4dxilUmiRK3ncaXciC39hjp7duALxZ/+vv4J9+Zcqr8htMQ9bgliPRwFgvj4MWQZ39w+RzrTy9f8Gz1qf+a+qQSkpUf3nfRUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089232; c=relaxed/simple;
	bh=triRoJFAO9QGmTQRAWS+cLWW1nI1iOFeYJbdtBXZxJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eVtiBP9igQbpLOocpm91j4sTQlnAPCIP8XI489ohAGo+G/Oe3EZo9weDa7D4uzjoPHAL506Fdf3hcIHHz+ZPFdMJSToJciFGduf3yD7PeClB0R1H0lDWL44pZQpULiIH+hEEpUDNqDYyFQgiWnG72m4oMUFr7CwQY+LRfqe3e/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jY++06bZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jY++06bZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ade574f05eso3240725ad.3
        for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 23:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772089230; x=1772694030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkyUhk8dgF38d8q1EBE3loZO3CJfZ89yev/FRmDZYJk=;
        b=jY++06bZ3vqtt0TOYxxM7bva3eo1fdwE+sdJM2GZw/5NprlmErJ/tPAD/gYID9c07Y
         hyWidz9tpJWr9yJh7P+KxUu6i4L2JPjCGm3Fry8ggRc561TAPZgDNAVol98KtZpTsA3v
         0hrYsFdRjg5VenEeIBN9eKh/CSqv+MrQnkK55fjqZ3oC9GUH5a3kGwSVqzu83d6ZtDng
         ZA+bGZK67WPAFBYmeW4O1dt0Eg53xMwMIR4R3eFAtQOytL3koMaRi6qza9jYLBkE684c
         yiRARtGfFCwLSwRKtTw+2xvUOmlqGCQArz52eKFBMYAa5E5YCX0GyvYjzszuKbbU2bM6
         guhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089230; x=1772694030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PkyUhk8dgF38d8q1EBE3loZO3CJfZ89yev/FRmDZYJk=;
        b=BWIP7eLZLEEVfv3vD2nPymZIJYD0Xqj4ac6YHMKwoBpdStR+Mc9KIeaiT4EB94jJfa
         FhUg5dicays/xFKseVPKYFJbGlTFULSuT9bX5u0OSbvZvsIfimWisbJakrqSGgUT+M5q
         z8EC2Wd/GA2TuA0CvUpftg3Ra3/g5w8HeTslHAKGPLCFjGXhvVDoCGhHwLpRn8KtGBfx
         AvOroFtvS1Z2vOPZbHbPag6D7UrohkgmMsGEENJaQC4F/1Vk6qY6uP0kdvB9hG8XxfIc
         RDYhtreSrM+cI7QpYa83dNFAjLcNU4+Q+ioNoTFl5YmvtfIdpdKP+Y/1hDZnp3SoE9Ss
         Oa5g==
X-Gm-Message-State: AOJu0YwlAzJGUvN13sataWCjKzn5uSLq1tgpai6a60vTLC9SukbBbqZG
	dedqZfWvy4e1hmMARfNo+3YdKRiQQyk7B8l7Wdsvsm4S+VVKfuOVoJzP
X-Gm-Gg: ATEYQzzgUwn2ZQ5TpVYkv35ldwyPwDHxxFZwmyyLD9216v7YAnJyri2WetV04Ypjj/r
	QDZ1zk43ssIjejCLTDiPKXsARMM/SJaBAe/RzmpI5ftt8BO4+cWJlnlk9lCK7gVElaWk83eQmbP
	NvsxxZCL6e5YxunhoMG6GnO4cMOhyFvoMI6Tp7TcPA8kqV2ZDYttIGA4/FIMbUrL12QliUC+s2d
	hQuOMXxYTTwpsfhIbdfAAi4/nfgLZGUtwY3Fp1577H12JlY9PCnENfjzVzgScfwv1eARVzWlZZD
	5ebXf21Skn2GTuhl4Xx7w7BwfzRwLOcJvAFdwXns3XERBikB8Kczjd7nE6jcIcYeugba44KgQ2O
	W7dQKwRB971mgrtLVKOdD2WW0wsQAWmfm/qGq40KdKztg4Gs7Ke9YWp5F+XNH9ZCA1baYP10DIa
	KjBf4hiy/ZO5iPcOQUlNJ7QdyhUjFjgDn6VAP0iLAE9fQRODY1r/yG9nAr6rjFbJsmPc5wLw==
X-Received: by 2002:a17:903:3848:b0:2ad:cede:3a1a with SMTP id d9443c01a7336-2ae03495f6fmr14300495ad.39.1772089230036;
        Wed, 25 Feb 2026 23:00:30 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.35])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2adfb5b2296sm14803135ad.5.2026.02.25.23.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:00:29 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	menglong8.dong@gmail.com
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH bpf-next 3/3] bpf/selftests: Enable fsession tests for LoongArch
Date: Thu, 26 Feb 2026 06:59:51 +0000
Message-ID: <20260226065952.4082859-4-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260226065952.4082859-1-hengqi.chen@gmail.com>
References: <20260226065952.4082859-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the LoongArch JIT supports BPF_TRACE_FSESSION, allow
the fsession-related tests to run on LoongArch.

    $ ./test_progs -a fsession_test,get_func_args_test,get_func_ip_test
    #136/1   fsession_test/fsession_test:OK
    #136/2   fsession_test/fsession_reattach:OK
    #136/3   fsession_test/fsession_cookie:OK
    #136     fsession_test:OK
    #138     get_func_args_test:OK
    #139     get_func_ip_test:OK
    Summary: 3/3 PASSED, 0 SKIPPED, 0 FAILED

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 tools/testing/selftests/bpf/progs/get_func_args_test.c | 3 ++-
 tools/testing/selftests/bpf/progs/get_func_ip_test.c   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/get_func_args_test.c b/tools/testing/selftests/bpf/progs/get_func_args_test.c
index 075a1180ec26..afb185fdf60c 100644
--- a/tools/testing/selftests/bpf/progs/get_func_args_test.c
+++ b/tools/testing/selftests/bpf/progs/get_func_args_test.c
@@ -167,7 +167,8 @@ int BPF_PROG(tp_test2)
 }
 
 __u64 test7_result = 0;
-#if defined(bpf_target_x86) || defined(bpf_target_arm64) || defined(bpf_target_riscv)
+#if defined(bpf_target_x86) || defined(bpf_target_arm64) || \
+    defined(bpf_target_riscv) || defined(bpf_target_loongarch)
 SEC("fsession/bpf_fentry_test1")
 int BPF_PROG(test7)
 {
diff --git a/tools/testing/selftests/bpf/progs/get_func_ip_test.c b/tools/testing/selftests/bpf/progs/get_func_ip_test.c
index 45eaa54d1ac7..3816a3616fbe 100644
--- a/tools/testing/selftests/bpf/progs/get_func_ip_test.c
+++ b/tools/testing/selftests/bpf/progs/get_func_ip_test.c
@@ -106,7 +106,8 @@ int BPF_URETPROBE(test8, int ret)
 
 __u64 test9_entry_result = 0;
 __u64 test9_exit_result = 0;
-#if defined(bpf_target_x86) || defined(bpf_target_arm64) || defined(bpf_target_riscv)
+#if defined(bpf_target_x86) || defined(bpf_target_arm64) || \
+    defined(bpf_target_riscv) || defined(bpf_target_loongarch)
 SEC("fsession/bpf_fentry_test1")
 int BPF_PROG(test9, int a)
 {
-- 
2.43.5

