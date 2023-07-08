Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47163236
	for <loongarch@lists.linux.dev>; Sat,  8 Jul 2023 09:01:14 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-991da766865so341270266b.0
        for <loongarch@lists.linux.dev>; Sat, 08 Jul 2023 02:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688806873; x=1691398873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nf6CWtf5sSzXSzp6IATkL8/vv+7S/TvwEjnbGt7d71E=;
        b=OrM5pDnq+Vr/EwlVe+DD3mzWWS3F0uzrYAzk6uvTn8z23ssNUOzdUk4ODCstn8JiDC
         0xzqEj7vmuAoxExq4m4ifummtrHEJwMOE8VxXlf8oA9CEoBQJi+mOrIgdgvL5c/BTHcC
         sEglGaq9q9WelZBfYcIEFp1WTTF0fNvDH3LXjQPEkwSETrn+pYLvX7dvlqReqjEQwJNP
         SF2Uwfs4OCTQhuy1nE9Oc+oSfRGWHjC0PcZ+qGhaupjOHy3D7BYy0dGiDl8n6b14XxC+
         xNWhdJWZO371SuO0GLE531DUPKyiD6PNkJfr0UEiQwt2oozP+87OdpTXPYmch25HcoyX
         BXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688806873; x=1691398873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nf6CWtf5sSzXSzp6IATkL8/vv+7S/TvwEjnbGt7d71E=;
        b=djs1qcK3EzBMy0OWj9HNlCB2hfVmnM8SiRwyHiB7/5uRdoV21BKUrnbYc3iNPJshNa
         xo5Rf2UN4r6DwqBQ4e40D3dnLznofPJNphe8tjWsT4/fNy2E0dqeKVGgPF20KNBbvfxh
         R048NYBCu1oxcZFX/AFW139e8eBJFXZhOi8kIMWKf+zb24BmchzPRvJFY1xwIpNKI2L7
         eBa/mukdh6DumNZmKiL+FjZ+tWisHRagNFEgCdUfA8fLYhzwn2WeBJBi9DtKJiT8vy53
         78SVBtqgtDtBP/VnqDyD9JyJ3t21kRi1CcFRY6zZeeJqHF7E0oA0QHfbP6HGWDgDe3yI
         BYEw==
X-Gm-Message-State: ABy/qLY0LsU7ZR3PYJJefMXnyXoExciTMD77V3Zjj9DvarVZvYIoDK0h
	xrbL0leHbuBCeBd+3gNhli8wgzyIdcdZIZG8
X-Google-Smtp-Source: APBJJlHvjbfghU+R1GVuA1W0C07GTu/GC7MEOE21FxMF61BP0T9NAF6jpjoHbxYT65YvPnfoueGJMA==
X-Received: by 2002:a17:906:5185:b0:992:a9c3:244f with SMTP id y5-20020a170906518500b00992a9c3244fmr5233427ejk.4.1688806872534;
        Sat, 08 Jul 2023 02:01:12 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id g10-20020a17090613ca00b00992ae4cf3c1sm3204313ejc.186.2023.07.08.02.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 02:01:12 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH 2/2] perf/ring_buffer: Use local_try_cmpxchg in __perf_output_begin
Date: Sat,  8 Jul 2023 11:00:37 +0200
Message-ID: <20230708090048.63046-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230708090048.63046-1-ubizjak@gmail.com>
References: <20230708090048.63046-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use local_try_cmpxchg instead of local_cmpxchg (*ptr, old, new) == old
in __perf_output_begin.  x86 CMPXCHG instruction returns success in ZF
flag, so this change saves a compare after cmpxchg (and related move
instruction in front of cmpxchg).

Also, try_cmpxchg implicitly assigns old *ptr value to "old" when cmpxchg
fails. There is no need to re-read the value in the loop.

No functional change intended.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 kernel/events/ring_buffer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index a0433f37b024..fb1e180b5f0a 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -191,9 +191,10 @@ __perf_output_begin(struct perf_output_handle *handle,
 
 	perf_output_get_handle(handle);
 
+	offset = local_read(&rb->head);
 	do {
+		head = offset;
 		tail = READ_ONCE(rb->user_page->data_tail);
-		offset = head = local_read(&rb->head);
 		if (!rb->overwrite) {
 			if (unlikely(!ring_buffer_has_space(head, tail,
 							    perf_data_size(rb),
@@ -217,7 +218,7 @@ __perf_output_begin(struct perf_output_handle *handle,
 			head += size;
 		else
 			head -= size;
-	} while (local_cmpxchg(&rb->head, offset, head) != offset);
+	} while (!local_try_cmpxchg(&rb->head, &offset, head));
 
 	if (backward) {
 		offset = head;
-- 
2.41.0

