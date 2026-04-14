Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE0918A6CF
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 01:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776130427; cv=none; b=ifg174neRtz3JCfVfq6hvvrD4ZCEv3IKc7kIToJ27xE1MVOC09bhgonNxvsmZKqyPuQ2ttsALVJ3JPdUClc6Zaz6betrRQUe+0YOJTckM79mJwqzcl83sgtbgTQFeN5FQLcqIJnGwXVekJNzDk9cX5GglUSdhXiyhoXyQ45v98Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776130427; c=relaxed/simple;
	bh=SIG0HRmZ/yJaAAiyWokfTrUn+AQzG/uqVe0n5cMSSg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oAmjJ2cRO2M2xbnqLpK8Efmlj/vszuHVEAuuf07G+2R1FVTYQH0XwsWsb4kAyC2xS9ClYGoxYAOHKTeJC0ZdmaEcGoZxwn0bI/RdWimiTfV5VvM1s7ZlZWnISArw09bkZqxV+2f6zmGuW2hSP+OU5Z5rqX2sVFM9rfO9x8KVol0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=sa4VxLyM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="sa4VxLyM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so38552495ad.2
        for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 18:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1776130426; x=1776735226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxMfCqtqqec9P4wHMXe915lJqSmTfSQZ5W0K1d+KSqk=;
        b=sa4VxLyMhptqeAFHjCi/M0oTzX3KFkg3I9qDX5c7nz4thugiibYvXmwF2DJUtEIf7m
         VkQuqcMY38DqPTJDqV3MC8dZthvq8ZFZe6Sj49vPiMDYvLWpqCdd/zx3GUjA+9+p2sZ6
         rkfLuh1rj8BGEPxSVrT/M3ryn7pU7MpZhyZm88yU6L3WG/wKorD2gK7GrwjTbOiD7ssX
         AsKGLkjCVxfMkOOMfyTll72NPi/QklBCku47F5N0p7AHG0eUh6cQNh+sI4aKLXfOO7q6
         J2JN6i0H///WpiIGneHmkpn+wg3FIqPpmfeD05QR2EPzX8iGMZi+fuUBOq2QIm0XTfap
         TO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776130426; x=1776735226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxMfCqtqqec9P4wHMXe915lJqSmTfSQZ5W0K1d+KSqk=;
        b=at6SK+XNdnqhVlb9TvkbTMbylJrqYrnwheN9xz0meH/vggcxT7RjB5jHNb3D2/O6Vk
         uztiOPYKLdb66I46VmohEEx7fQnAQ72kuxoApdoqM0vt8zUU02yEHXSs2sqHUnJKRuYt
         O2/910uFIqimrfX6bo8EgE5LPZ6ZuHfjyOQUTncTMpJgWC84Tk07bpWbPU9ArfmopRV8
         z3Xtcf2ErLhev0f9lKHZypvdyow+RUEGTi9/dNud6QmlRIR/ZCPn4oVqdst2cYy/yTIO
         WAOKWqb7aLCvLq/ofTk9RoFqruceBXdbKKBj5s2wZQazVtwKMDfXLj0MJ8rH6I66gKfC
         gDMA==
X-Gm-Message-State: AOJu0YzFpeuYBPJR1uLuXVLQB+JWJ/gY5y1debP4zN6GXl6RM0hZQDSU
	bhDI2MzDm2Y37J9o9fIG55oQXlI/O40jCXl++dOkQbFzdgWL7e6Glqoo4CALXXn7nHU=
X-Gm-Gg: AeBDietncmp3ufE6bhzZwuLEkHBSAYqlpefaxYblWFr3LjeK+gXm8qxIUav8I1nOVPL
	l+J4+sl0DsK8ZtAEKRLYqRXlClikPpnIs6b5Rg1m27sCkdUYdzb7xPZtPyBQdENkQAF4XAGMadt
	M5oK8x5bG0UxEEsq4ZqnwpBmLv321T3nJBUtfFBk0emVb5j7+cLxq7qwPjU7o/GJl57ycRw/vbk
	onCsM3HueJcJ3V74NiPKlvfmirpKngxgBxKoDUbqBoKkyBDpQ6NaQMzPULhSWwsVmNuQ3UObk1G
	SAvh2RV4dtriXkj8WwKcZrErVClhhVdMIA6dXjO+jYCUEoMJiQ5mAqKT8qAV0u8d0Ycs1ge2tyH
	pU4tE0tKgHU4xiSRicawrfW3CBR9H5xzbNhGCSpUrrYKn/wyYeb5I5h2TGk90CL0yu1RSmQJX1k
	Z0O0YpC7mF3C8Z6bQ5U1x8
X-Received: by 2002:a17:902:6942:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b2d5a9e7bemr108122225ad.41.1776130426061;
        Mon, 13 Apr 2026 18:33:46 -0700 (PDT)
Received: from gpc ([2400:8902:e002:de21:a5e:ca8a:49d9:fb8a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f0ada5sm138024535ad.42.2026.04.13.18.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 18:33:45 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: linux-kernel@vger.kernel.org
Cc: loongarch@lists.linux.dev,
	WANG Rui <r@hev.cc>
Subject: [PATCH] MAINTAINERS: Add loongarch mailing list for perf tooling
Date: Tue, 14 Apr 2026 09:33:33 +0800
Message-ID: <20260414013333.15594-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In practice, patches touching the LoongArch-specific code under
tools/perf are not always reaching the LoongArch mailing list,
which makes it harder for the architecture maintainers to track
relevant changes.

Add the loongarch mailing list entry for the LoongArch-specific
perf tooling paths to ensure proper notification.

Signed-off-by: WANG Rui <r@hev.cc>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3adc870d523b..4eda6355dff2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20720,6 +20720,11 @@ F:	tools/perf/pmu-events/arch/arm64/
 F:	tools/perf/util/arm-spe*
 F:	tools/perf/util/cs-etm*
 
+PERFORMANCE EVENTS TOOLING LOONGARCH
+L:	loongarch@lists.linux.dev
+F:	tools/perf/arch/loongarch/
+F:	tools/perf/util/*/*loongarch*
+
 PERSONALITY HANDLING
 M:	Christoph Hellwig <hch@infradead.org>
 L:	linux-abi-devel@lists.sourceforge.net
-- 
2.53.0

