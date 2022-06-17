Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126CC17ED
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 07:17:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [112.20.110.105])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX92JKqxirf5HAA--.12068S2;
	Fri, 17 Jun 2022 15:17:30 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: chenhuacai@kernel.org,
	alexs@kernel.org,
	bobwxc@email.cn,
	seakeel@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	corbet@lwn.net,
	kernel@xen0n.name,
	jiaxun.yang@flygoat.com,
	linux-doc@vger.kernel.org,
	siyanteng01@gmail.com,
	loongarch@lists.linux.dev
Subject: [PATCH 0/2] docs/loongarch: improve loongarch documents
Date: Fri, 17 Jun 2022 15:19:05 +0800
Message-Id: <cover.1655450200.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9DxX92JKqxirf5HAA--.12068S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWktw4xZrWxKF13Gw18Grg_yoWxuwb_uF
	Z7Ga45Cw42qa4rGayxKr13AF98JF4j93Z8AF1ktFsrKFyftwnxAr4DW390vr10qFsruFZ8
	KrWkXryrAr12qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUYMKZDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/

Rewrite all the notes in the loongarch document.

Note is an admonition, let's use the directives
implemented in the reference reStructuredText parser.
About reStructuredText Directives,
see <https://docutils.sourceforge.io/docs/ref/rst/directives.html>

Yanteng Si (2):
  docs/loongarch: rewrite all the notes
  docs/zh_CN: rewrite all the notes

 Documentation/loongarch/introduction.rst      | 15 ++++++++-----
 Documentation/loongarch/irq-chip-model.rst    | 22 +++++++++++--------
 .../zh_CN/loongarch/introduction.rst          | 14 +++++++-----
 .../zh_CN/loongarch/irq-chip-model.rst        | 15 ++++++++-----
 4 files changed, 39 insertions(+), 27 deletions(-)

-- 
2.27.0

