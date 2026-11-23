Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428443;
	b=fN511uhdiOuYUzwKY33t8aNuCQrntim0mwgeHyf+nr5+MtI4zYES17I+hENQvDpAJYsv
	 FuI/snGy73i5CUXnUUyo7qaB7LZ1WcToz0zbXmRiCW1n+a6TmSBrCtTr9rCoB7AIk/flu
	 miZLeMtFSChe6Usnrha6Puvks8QBl6+9ngSuPb2jkx4L7KrBQEITyiBPCkW1GNNS7OO1I
	 IF+JKEU47Bbhd0RZCT3ETywtuxxFn/K20hn71PSD+k0h2u1zSXIVGzZsqWFOvhpYdYjqy
	 XK70anWgE2ZOyhjGgBugY5LyTtf/O5Ub3QNqQSaprJJ7UptLmiLdRTI27A4MUPl764g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZCV7rj7O3YjHOcFzGHR54dLdeKT96fbmxzbKfW4RNF8=;
	b=pUSFhc/bkkxJrKZBUkskPowAYXxdyju8fM63qREQLVMXYadS4eq/weW+mDf9SPp7k8zf
	 gNviukaLeQb8MlUB10C39CwvHakTbwTmspVKbf6mjbN0HeNB1jcPUbm0z4O5nCfoZPZRC
	 yaR9Y/l00cNNuLlWS0tGdKexNpM18cstcrY31kx55Twsetfgb+bbywLivwaZITzQJ+aFC
	 /5He1olZink82dkwSUEIaJVxElzKiuh8mNygyBB0+S0rM2L5KJ1fseA9WJWcLaj/8qEDF
	 hzw4WBb08rHaM30EExXjOe+v6W4fAhP439BePyY/lVEbJyaItYNYwvZ+89JKyYid/EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05J8LrBz;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39A5606A31F
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 10:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C39A5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05J8LrBz
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so9325991eec.0
        for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 02:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428442; x=1796033242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCV7rj7O3YjHOcFzGHR54dLdeKT96fbmxzbKfW4RNF8=;
        b=05J8LrBz9rPVW+q00PRldk2dSwepgiaEeXyQn+h0VnaKiA8CznP6kwyIYBNpnD7xy1
         PF2vUx7Uz62Xyou0ovO84XEJBsWwuKDSsHbUyc6TOnbT6rSC1XccBpCc2NE81Q/t0Jjz
         fiJVVxw/k/GqxqvDkD9NExCc2s87rvFGJ6Hlqg7iX9DKURkP/F4XSHJ6ScMmR/uTHAm9
         U1PyAPRMyom3FBrmHEryfOCgeZglcMrcKV46oRYvfeUFgZ3yZ5Py0epF4HXHHPaChn1Q
         LNrYAkaLdKEBguC5p/sMx1GiO4CSrQBhM+3F9Stzxo5mt4aAOQMAxts/SDOFlFhdaYIs
         6rQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428442; x=1796033242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCV7rj7O3YjHOcFzGHR54dLdeKT96fbmxzbKfW4RNF8=;
        b=KDwUOGRFIzjeTZ2w+uSQQSqZn9Yf9Ua0zPQ4qt8MG5O65XfTqJ2E/BwHuy/9zeG7XR
         VBOYYCVXxzsCUtQeHEuAhGtYtOqLvO/X/WzRkE9qH2r1DQYv97g7NusS4QHmH7n+KptO
         XjCRCoergcU35zWZs4/9Aeza7mNCdRtkU/J0V476Blv9jlw+EzAVpJB38CkxK54Y+NJ3
         MjwrI0R9P/un2vyFN9YyDTsUz9oTCMASlmC3SvM4Uiaz2oFEaTOQtKl29PIXDfo3hsHO
         +mqZ38598HgeWbJ8suWYfw6XRljyQR2Riux6gEaqF3rp0+Q7B/3xMl9uDGtMZH+Mgq0p
         dSZQ==
X-Forwarded-Encrypted: i=1; AL+hErEzfKgGQY/OD4EdNaglFYfZAhKzOEpmRvtjPnKIIfxJDyU1X0YRY/4B1oX4a7jA9SIUWuJ82PI5M48=@lists.linux.dev
X-Gm-Message-State: APuU4Z9RUWetBVw0WsCEtKaDRShR04vy75QWY8JlhR6S+N3AzxF6mvx0
	qmtVEb4K65zGKOcaIUc8ljRps0ydx3C8xDvC2jmznGpq4wFxKPSNvGqB
X-Gm-Gg: AZFdTZcYy74pZcvhqmHowL16cckwqMZlGbsBjxDeBGn+FQun8ucC582LdT2/+69kswZ
	8hqITnQIo2r2Xj3C3JbKEGgE6CgIJsMCb3ZfRqDBgbR03znFq95hiO4Sf4QDLPdYAyxGqGjer+M
	HiivRledLuivwBhYWGgSlIqRK17fsJ8K8TlcDfnK4i66Vcc0f79PL8cVpN8LGgoXa4Fwj9MLJAc
	L/JcD0xZFVRYBCvOz7n99nZ/r/056WZRxFzSnsud6pHrYb8qhcngk6ov5/jieIjEe4jMvH7mGmZ
	k5FHHNBEEFRuBlRv5juymAZ4BfmZ2gBaZfwGH18GJBQJt+PHvvU1NK8+gC4zfX0WtAvxud3+s3W
	9k905fDJv1wHmDw/SGJIEMRLTWiAsRyYzLL5FdvM2g8BI5k7BCaXDLvGCxbHjGEZhPjt/Imj2x0
	k65cAe7rz0c0T9424GzD9hj8nKj25CBur/0fmg6Z2OPLpMxKajorG75yEHvj32QWEiYgziyjBk/
	ICDw+7B822tYNq9AFjDNYoQBBJbcrVhcTpA1e7F4RSTbnQnPYCFGkW7WEzToTmnWwRx2Dc2nMUM
	+ARA0W/b92iiD7KQW7e3Co+O9zDWbxBmp0VTEH1AHg==
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr5039152eec.31.1795428441777;
        Mon, 23 Nov 2026 02:07:21 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm34145673eec.15.2026.11.23.02.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:07:21 -0800 (PST)
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
Subject: [PATCH 0/2] KVM: LoongArch: selftests: MAINTAINERS coverage and a VM leak
Date: Mon, 23 Nov 2026 15:36:59 +0530
Message-ID: <20261123100701.1679376-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Two small fixes to the LoongArch KVM selftests. Patch 2 frees the VM on
the PMU test's skip path. Patch 1 came out of routing it:
get_maintainer.pl did not name the LoongArch KVM maintainers for
tools/testing/selftests/kvm/loongarch/, because the MAINTAINERS entry
does not cover that directory, so this series would otherwise have
gone to Paolo, Sean and Shuah only.

Based on loongarch-kvm in linux-loongson.git.

Patch 2's hunk sits next to the one in "KVM: selftests: Convert comma
to semicolon" [1], which is not applied yet. They do not overlap and
apply in either order.

Compile-tested only. Patch 2 builds: tools/testing/selftests/kvm/loongarch/
pmu_test links for loongarch64 with a GCC 15.2.1 cross compiler, using
glibc from Debian's loong64 port as the sysroot. The binary was not run.
Patch 2 changes the PMU-not-enabled skip path, which only runs on a
LoongArch host whose VM config leaves the PMU off.

[1] https://lore.kernel.org/all/20260428053204.1018608-1-nichen@iscas.ac.cn/

Gokul K (2):
  MAINTAINERS: Add the LoongArch KVM selftests directory
  KVM: LoongArch: selftests: Free the VM when the PMU test skips

 MAINTAINERS                                      | 1 +
 tools/testing/selftests/kvm/loongarch/pmu_test.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.54.0


