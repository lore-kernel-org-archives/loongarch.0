Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428461;
	b=HiBP3qSoa0dXTIV6dBNjuqfaLQbn8J0FuMqk3CIJA1XHzltNOvK/ZcRgNleZPJOr6t79
	 KJBWxVeSmR+B+2/sbZ7rjkMN5pTGJVG7Sd7wa45H0kLuLB/md6n0z9RIkg0Q9KqtTeVOW
	 9/n9Z5Ug59iqe3N8G8uv02fmMA0gsAtYnqpuCjOrL6JjEh5BpBvBtOCGYEir649RdNF9E
	 zHWwuTFUdnI/FGkodm/d7PCgepV9UiVf8ZPgR8f10agyLLD2vC8n8OchWTqkvdqnG+hGu
	 AaaPQ+6xZIxQ88vxX5lJYeMVZ+acLAgBBOy0iSkbotwv63XaG3ZrHxhhrqzdpVQKDZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
	b=TMKBQbwaW5IZIPX38uvDpbUnfgp74HeetgTqD7zakiPmEBM2v8do+i7UR+gyvHT3L+cs
	 mUh+JYf6GzMpntJMVfFkFRZAvVAnkzaevhaysqzXgwOgRe3lYGddWKclJaxzSPPigVPEK
	 UJD4mYAss5wKG38U5LoFWCfB0WqQye+XRk6yDAwJYB+8uXKSGrBlPY4p9bgyVSSiRbcei
	 9/et3mZr4V23jRkDKP1Ryn58hu54iIx5vpt/fKp0WYYDVzuAy1HBCGoX58jbtquyPbIiz
	 lqM7R7ZpWbm/O8l52hDA5nkJfSbAq/NqalAI3l/ZDFWa2Qlx98OVHty3GEjshzJekGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WrNQSGp9;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D16606A31E
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 10:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D16606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WrNQSGp9
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-385d8a00598so4215256eec.1
        for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 02:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428459; x=1796033259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
        b=WrNQSGp9Z3Pgo+ucjO9JfWEFSotgxEcALnF8iD8SiDy2D6gU/IqaUDIbRhwEyNBHdi
         oSz2jD0lgeVk605tWGNHFWM3TTX829Axjj5bSSfwzA5iEFvAvJam0YRle1jA8I/SPv8G
         hg0S15bBOEAtZdV6KJzA/MXmcax/s0atywpiay71bmKKOXzKwE6OEEk17PvcWlTBw4DD
         HcMQnOm2cUwywy2wBQBBxSDtbxiBy7lTV0td89IteLHqJ5L8cki7wbW8PJcjHGPS9H0K
         s6yaM0oTyms9M4o3PoVNojVylZEl3Ep+5GOkTIefkAtiUDhU1rNAoDHQbIDNMelJE13h
         hbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428459; x=1796033259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
        b=RgVraNgitu0NxZ0RyQ1wj2JNaHicbZt/sc2kt+1Ux/98EiMBmhEUDhBRcuw2555uos
         xtix5NkGUIDONsxIcVCvDB8q3B8QsO2mB+7NiKdGx5ttUbWO6EmIFG8pKf44uoVtjG+j
         xm5kpTuUriLRxb/j0Wdnm2LwwKg8DLbMoC5hPEruw1ARgghWDzJVrE/ufTW3XtZAQ3JU
         Uqfnwceot7jS/6QTmdK93TXtCqkbF+0I51sY386uwu+tPew3cL5Q7fPKf/65olVm5l/H
         ycoByeB2O9n89KZPQezPYUByB/+ewkje6CEris2srPvXeECPqOpbHv2xV5VDESqlIXfF
         vVQw==
X-Forwarded-Encrypted: i=1; AL+hErEZUHgyZ4sIQxe6T8AsqON/8+VNhUcvImX64QTV3rxkQ/HIGg4Y8TBiLOUj042aFUqT7LahdwKp4Lc=@lists.linux.dev
X-Gm-Message-State: APuU4Z+87ZII1EYpwMeyOKQZ8qbQwXjNUU0IcWTstC9lQlpDJgP8cQ6k
	jkTsmtAGLphm5+qoFBeGRrAJtlXv7OdCfM3kXLkryVBuKmCcZYTc9wz9
X-Gm-Gg: AZFdTZc7YQzx0500lUpRwGqCf42XYUvZHEF4Xz6T14vItQPr+QPzWGUx+QKisPXtcau
	opXAFLQXN8eMXYaKaEvuFB2l+69J16cu3RODZ7/VTlVMqF2kNC2CfXUqcgyuwNYEY4MJBNZ411t
	LH4Dcf1gnXwtOD0qH2fqKZwCHuJgJH7y54ATbTg41HAVmJ8Mp3tW85DfqpawP60dZl7CUR4dF3x
	365+XP3KsHdL6E6OUA4aDVIkaR0gcTKktkqcdvJ+BaFWz1L9N3eOR6/ZbKn/nmldzAN0F4cD58/
	hiU84PPry35XeMlYqClOCseS+BMQbU9rMopQLbN+xoTSLt6ww64DoXTSr74NkCJMwbbSysGD9Mm
	0q+vHdRCEy73viGc/ipt+o95KTtzP6VGgKr/SmksLFI1NlogWFzdk+HY1a9fGvHBMRfXs0CN0LN
	fTJiEupUhKWBG+XHvow41vY5wZV15YdGb/KXJjKrurRdKMMtJj6piuH5SQKA1fOX+wIJ+5C02Aj
	qCtcOmwXNz8/1KLvoNGKxVSsSUzZH+pe2GqN8IUFMzWxKMOOQPSxF/OGGafT8/z54OyhdjA97TT
	iZcMh3jX2SUfxIqbPtuzodKH+9canttmlQaLnhoGqg==
X-Received: by 2002:a05:693c:8843:b0:386:b429:fe0 with SMTP id 5a478bee46e88-386b429175cmr1773472eec.16.1795428459292;
        Mon, 23 Nov 2026 02:07:39 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm30929402eec.8.2026.11.23.02.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:07:38 -0800 (PST)
From: Gokul K <gokul02k@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Song Gao <gaosong@loongson.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] KVM: LoongArch: selftests: Free the VM when the PMU test skips
Date: Mon, 23 Nov 2026 15:37:01 +0530
Message-ID: <20261123100701.1679376-3-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123100701.1679376-1-gokul02k@gmail.com>
References: <20261123100701.1679376-1-gokul02k@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

main() creates the VM before asking whether it has the PMU feature, and
when it does not, returns KSFT_SKIP directly. That skips the done: label
through which every other exit frees the VM. Set ret and jump there
instead.

Fixes: 11c840192768 ("KVM: LoongArch: selftests: Add basic PMU event counting test")
Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 tools/testing/selftests/kvm/loongarch/pmu_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/loongarch/pmu_test.c b/tools/testing/selftests/kvm/loongarch/pmu_test.c
index ec3fefb9ea97..c9dd3cf5de06 100644
--- a/tools/testing/selftests/kvm/loongarch/pmu_test.c
+++ b/tools/testing/selftests/kvm/loongarch/pmu_test.c
@@ -176,7 +176,8 @@ int main(int argc, char *argv[])
 		pr_info("PMU is enabled in VM\n");
 	} else {
 		print_skip("PMU not enabled by VM config\n");
-		return KSFT_SKIP;
+		ret = KSFT_SKIP;
+		goto done;
 	}
 
 	while (1) {
-- 
2.54.0


